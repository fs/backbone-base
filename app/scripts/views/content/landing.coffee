define [
  'marionette'
], (Marionette) ->

  class LandingView extends Marionette.ItemView
    className: 'page-header'
    template: JST['templates/content/content_landing']
