define [
  'routers/base'
  'controllers/dashboard_controller'
], (BaseRouter, Controller) ->

  class DashboardRouter extends BaseRouter
    navigation: 'dashboard'

    initialize: ->
      @controller = new Controller

    appRoutes:
      'dashboard': 'index'
