define [
  'marionette'
], (Marionette) ->

  class MainLayout extends Marionette.Layout
    el: '#wrapper'
    template: JST['templates/layouts/layout']

    regions:
      headerRegion: '#header_region'
      mainRegion: '#main_region'
