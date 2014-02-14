define [
  'marionette'
  'controllers/main_controller'
], (Marionette, Controller) ->

  class MainRouter extends Marionette.AppRouter
    controller: new Controller()
    appRoutes:
      '': 'indexPage'
      'page': 'somePage'
      'articles': 'showArticles'
      'articles/:id': 'showArticle'
