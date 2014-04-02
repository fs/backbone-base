define [
  'routers/base'
  'controllers/navigation_controller'
  'facades/session'
  'helpers/routes'
], (BaseRouter, Controller, Session, routes) ->

  class NavigationRouter extends BaseRouter
    initialize: ->
      @controller = new Controller

      @listenTo Session, 'create destroy', @onSessionChange

    onSessionChange: ->
      if Session.isLoggedIn()
        path = routes.dashboardPath()
      else
        path = routes.rootPath()

      @navigate(path, trigger: true)
