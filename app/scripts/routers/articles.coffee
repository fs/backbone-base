define [
  'routers/base'
  'controllers/articles_controller'
], (BaseRouter, Controller) ->

  class ArticlesRouter extends BaseRouter
    initialize: ->
      @controller = new Controller

    appRoutes:
      'dashboard/articles': 'index'
      'dashboard/articles/:id': 'show'
