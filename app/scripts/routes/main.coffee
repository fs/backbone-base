define [
  'marionette'
  'controllers/main_controller'
], (Marionette, Controller) ->

  class MainRouter extends Marionette.AppRouter
    controller: new Controller()

    appRoutes:
      '': 'indexPage'
      'page': 'somePage'
      'articles/:id': 'showArticle'

    # NOTE: route filter usage example
    # before:
    #   '': 'redirectIfNotLoggedIn'

    # redirectIfNotLoggedIn: ->
    #   @navigate '/', replace: true