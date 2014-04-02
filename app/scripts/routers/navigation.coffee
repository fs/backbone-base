define [
  'routers/base'
  'facades/session'
  'helpers/routes'
], (BaseRouter, Session, routes) ->

  class NavigationRouter extends BaseRouter
    initialize: ->
      @listenTo Session, 'create destroy', @onSessionChange

    onSessionChange: ->
      if Session.isLoggedIn()
        path = routes.dashboardPath()
      else
        path = routes.rootPath()

      @navigate(path, trigger: true)
