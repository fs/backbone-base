define [
  'marionette'
  'controllers/main_controller'
  'facades/session'
], (Marionette, Controller, Session) ->

  class MainRouter extends Marionette.AppRouter
    initialize: ->
      @controller = new Controller
      @listenTo @controller, 'logout', @redirectIfNotLoggedIn

      super

    appRoutes:
      '': 'indexPage'
      'dashboard': 'showDashboard'
      'dashboard/articles': 'showArticles'
      'dashboard/articles/:id': 'showArticle'
      'logout': 'logout'

    before:
      'dashboard(/*path)': 'redirectIfNotLoggedIn'

    redirectIfNotLoggedIn: ->
      unless Session.isLoggedIn()
        @navigate '/', trigger: true
        false
