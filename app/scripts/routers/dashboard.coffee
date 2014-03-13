define [
  'routers/base'
  'controllers/dashboard_controller'
], (BaseRouter, Controller) ->

  class DashboardRouter extends BaseRouter
    initialize: ->
      @controller = new Controller

    appRoutes:
      'dashboard': 'index'
