define [
  'application'
  'routers/base'
  'facades/session'
  'helpers/routes'
], (App, BaseRouter, Session, routes) ->

  class NavigationRouter extends BaseRouter
    initialize: ->
      @listenTo Session, 'create destroy', @onSessionChange
      @listenTo Backbone.history, 'route', @onNavigationChange

    onSessionChange: ->
      if Session.isLoggedIn()
        path = routes.dashboardPath()
      else
        path = routes.rootPath()

      @navigate(path, trigger: true)

    onNavigationChange: (router) ->
      App.vent.trigger 'navigation:change', router.navigation
