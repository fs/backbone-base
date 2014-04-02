define [
  'routers/base'
  'controllers/dashboard_controller'
], (BaseRouter, Controller) ->

  class DashboardRouter extends BaseRouter
    navigation: 'dashboard'

    appRoutes:
      'dashboard': 'index'

    initialize: ->
      @controller = new Controller
