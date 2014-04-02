define [
  'routers/base'
  'controllers/landing_controller'
], (BaseRouter, Controller) ->

  class LandingRouter extends BaseRouter
    appRoutes:
      '': 'index'

    initialize: ->
      @controller = new Controller
