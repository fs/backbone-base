define [
  'marionette'
  'application'
  'views/content/landing'
], (Marionette, App, ContentLandingView) ->

  class LandingController extends Marionette.Controller
    index: ->
      App.mainRegion.show(new ContentLandingView)
