define [
  'marionette'
  'controllers/main_controller'
  'models/user_session'
], (Marionette, Controller, UserSession) ->

  class MainRouter extends Marionette.AppRouter
    initialize: ->
      @controller = new Controller
      @listenTo @controller, 'logout', @redirectIfNotLoggedIn

      super

    appRoutes:
      #on unknown reason without '/' doesn't work articles/:id/'
      '': 'indexPage'
      'articles/': 'showArticles'
      'articles/:id/': 'showArticle'
      'logout/': 'logout'

    # NOTE: route filter usage example
    before:
      'articles/:id/': 'redirectIfNotLoggedIn'
      'articles/': 'redirectIfNotLoggedIn'

    redirectIfNotLoggedIn: ->
      session = UserSession.getInstance()
      unless session.isLogged()
        @navigate '/', trigger: true
        false
