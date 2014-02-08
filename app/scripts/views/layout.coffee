define [
  'marionette'
  'views/header/header_layout'
], (Marionette, HeaderView) ->

  class MainLayoutView extends Marionette.Layout
    el: '#wrapper'
    template: JST['templates/layout']

    regions:
      headerRegion: '#header_region'
      mainRegion: '#main_region'

    onRender: ->
      view = new HeaderView
      @headerRegion.show(view)
