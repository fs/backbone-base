define [
  'routers/base'
  'controllers/main_controller'
  'facades/session'
], (BaseRouter, Controller, Session) ->

  class MainRouter extends BaseRouter
    initialize: ->
      @controller = new Controller
      @listenTo @controller, 'logout', @redirectIfNotLoggedIn

    appRoutes:
      '': 'index'
      'logout': 'logout'
