define [
  'Marionette'
  'Views/header/header_navigation_view'
  'Views/header/header_login_form_view'
], (Marionette, HeaderNavigationView, HeaderLoginFormView) ->

  class HeaderLayoutView extends Backbone.Marionette.Layout
    template: JST["templates/header/header_template"]

    regions:
      navigationRegion: "#navigation_region"
      formRegion: "#login_form_region"

    onRender: ->
      @navigationRegion.show(new HeaderNavigationView())
      @formRegion.show(new HeaderLoginFormView())

