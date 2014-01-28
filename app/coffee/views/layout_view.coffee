define [
  'Marionette'
  'Views/header/header_layout_view'
], (Marionette, HeaderView) ->

  class MainLayoutView extends Backbone.Marionette.Layout
    el: "#wrapper"
    template: JST['app/templates/layout_template.html']

    regions:
      headerRegion : "#header_region"
      mainRegion : "#main_region"

    initialize: ->
      @render()
      @headerRegion.show(new HeaderView())
