define [
  'marionette'
  'controllers/main_controller'
  'models/user_session'
], (Marionette, Controller, UserSession) ->

  class MainRouter extends Marionette.AppRouter
    initialize: ->
      @controller = new Controller
      @listenTo @controller, 'logout', @redirectIfNotLoggedIn
      @listenTo @controller, 'dashboard', @showDashboard

      super

    appRoutes:
      #on unknown reason without '/' doesn't work articles/:id/
      '': 'indexPage'
      'dashboard/': 'showDashboard'
      'dashboard/articles/': 'showArticles'
      'dashboard/articles/:id/': 'showArticle'
      'logout/': 'logout'

    # NOTE: route filter usage example
    before:
      'articles/:id/': 'redirectIfNotLoggedIn'
      'articles/': 'redirectIfNotLoggedIn'

    redirectIfNotLoggedIn: ->
      #didn't work without refresh page
      session = UserSession.getInstance()
      unless session.isLogged()
        @navigate '/', trigger: true
        false
