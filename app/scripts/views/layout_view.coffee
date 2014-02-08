define [
  'marionette'
  'views/header/header_layout_view'
], (Marionette, HeaderView) ->

  class MainLayoutView extends Marionette.Layout
    el: '#wrapper'
    template: 'templates/layout_template'

    regions:
      headerRegion: '#header_region'
      mainRegion: '#main_region'

    onRender: ->
      view = new HeaderView
      @headerRegion.show(view)
