define [
  'application'
  'views/content/landing'
], (App, ContentLandingView) ->

  class LandingController extends Marionette.Controller
    index: ->
      App.mainRegion.show(new ContentLandingView)
