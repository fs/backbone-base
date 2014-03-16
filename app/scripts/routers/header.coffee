define [
  'routers/base'
  'controllers/header_controller'
], (BaseRouter, Controller) ->

  class MainRouter extends BaseRouter
    initialize: ->
      @controller = new Controller
      @listenTo @controller, 'logout', @redirectIfNotLoggedIn

    appRoutes:
      'logout': 'logout'
