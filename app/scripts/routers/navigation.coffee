define [
  'application'
  'routers/base'
  'facades/session'
  'helpers/routes_helper'
], (App, BaseRouter, Session, Routes) ->

  class NavigationRouter extends BaseRouter
    initialize: ->
      @listenTo Session, 'create destroy', @onSessionChange
      @listenTo Backbone.history, 'route', @onNavigationChange

    onSessionChange: ->
      if Session.isLoggedIn()
        path = Routes.dashboardPath()
      else
        path = Routes.rootPath()

      @navigate(path, trigger: true)

    onNavigationChange: (router) ->
      App.vent.trigger 'navigation:change', router.navigation
