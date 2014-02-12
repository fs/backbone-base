define [
  'marionette'
], (Marionette) ->

  class MainLayoutView extends Marionette.Layout
    el: '#wrapper'
    template: JST['templates/layout']

    regions:
      headerRegion: '#header_region'
      mainRegion: '#main_region'
