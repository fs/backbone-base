define [
  'marionette'
  'application'
  'facades/session'
  'helpers/routes_helper'
  'backbone.routefilter'
], (
  Marionette
  App
  Session
  Routes
) ->

  class BaseRouter extends Marionette.AppRouter
    before:
      'dashboard(/*path)': 'redirectIfNotLoggedIn'

    redirectIfNotLoggedIn: ->
      unless Session.isLoggedIn()
        @navigate(Routes.rootPath(), trigger: true)
        false
