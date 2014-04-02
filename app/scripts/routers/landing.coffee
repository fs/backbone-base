define [
  'routers/base'
], (BaseRouter) ->

  class LandingRouter extends BaseRouter
    appRoutes:
      '': 'index'
