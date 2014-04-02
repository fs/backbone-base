define [
  'routers/base'
], (BaseRouter) ->

  class DashboardRouter extends BaseRouter
    navigation: 'dashboard'

    appRoutes:
      'dashboard': 'index'
