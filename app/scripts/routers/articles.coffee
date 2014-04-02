define [
  'routers/base'
  'controllers/articles_controller'
], (BaseRouter, Controller) ->

  class ArticlesRouter extends BaseRouter
    navigation: 'articles'

    appRoutes:
      'dashboard/articles': 'index'
      'dashboard/articles/:id': 'show'

    initialize: ->
      @controller = new Controller
