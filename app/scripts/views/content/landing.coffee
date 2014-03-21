define [
  'marionette'
  'routers/landing'
  'templates'
], (Marionette, Router) ->

  class ContentLandingView extends Marionette.ItemView
    className: 'page-header'
    template: JST['templates/content/landing']
