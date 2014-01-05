define ['Marionette'], (Marionette) ->

  class AppLayout extends Backbone.Marionette.Layout
    el: "body"
    template: JST['app/templates/layout_template.html']

    regions:
      headerRegion : "#header_region"
      mainRegion : "#main_region"
      footerRegion : "#footer_region"
