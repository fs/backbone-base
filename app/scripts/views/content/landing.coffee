define [
  'marionette'
  'routers/landing'
  'templates'
], (Marionette, Router) ->

  class ContentLandingView extends Marionette.ItemView
    template: JST['templates/content/landing']
