define [
  'marionette'
  'application'
  'facades/session'
  'helpers/routes'
], (Marionette, App, Session, routes) ->

  class BaseRouter extends Marionette.AppRouter
    before:
      'dashboard(/*path)': 'redirectIfNotLoggedIn'

    after:
      '*path': 'afterPageIsLoaded'

    redirectIfNotLoggedIn: ->
      unless Session.isLoggedIn()
        @navigate(routes.rootPath(), trigger: true)
        false

    afterPageIsLoaded: ->
      App.vent.trigger 'navigation:page_loaded', @navigation
