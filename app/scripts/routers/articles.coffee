define [
  'routers/base'
], (BaseRouter) ->

  class ArticlesRouter extends BaseRouter
    navigation: 'articles'

    appRoutes:
      'dashboard/articles': 'index'
      'dashboard/articles/:id': 'show'
