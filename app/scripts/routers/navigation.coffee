define [
  'routers/base'
  'controllers/navigation_controller'
], (BaseRouter, Controller) ->

  class NavigationRouter extends BaseRouter
    initialize: ->
      @controller = new Controller
      @listenTo @controller, 'logout', @redirectIfNotLoggedIn

    appRoutes:
      'logout': 'logout'
