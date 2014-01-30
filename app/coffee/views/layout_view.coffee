define [
  'Marionette'
  'Views/header/header_layout_view'
], (Marionette, HeaderView) ->

  class MainLayoutView extends Backbone.Marionette.Layout
    el: "#wrapper"
    template: JST['templates/layout_template']

    regions:
      headerRegion : "#header_region"
      mainRegion : "#main_region"

    initialize: ->
      @render()
      @headerRegion.show(new HeaderView())
