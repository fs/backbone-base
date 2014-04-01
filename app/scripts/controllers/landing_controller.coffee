define [
  'application'
  'views/content/landing'
  'facades/session'
  'helpers/routes'
], (App, ContentLandingView, Session, RoutesHelper) ->

  class LandingController extends Marionette.Controller
    initialize: ->
      App.vent.on('current_user:logout', @onLogoutUser)

    index: ->
      App.mainRegion.show(new ContentLandingView)

    onLogoutUser: ->
      Session.destroy()
      App.navigate(RoutesHelper.rootPath(), trigger: true)
