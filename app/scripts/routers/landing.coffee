define [
  'routers/base'
  'controllers/landing_controller'
], (BaseRouter, Controller) ->

  class LandingRouter extends BaseRouter
    initialize: ->
      @controller = new Controller

    appRoutes:
      '': 'index'
