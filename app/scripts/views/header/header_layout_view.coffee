define [
  'marionette'
  'views/header/header_navigation_view'
  'views/header/header_login_form_view'
], (Marionette, HeaderNavigationView, HeaderLoginFormView) ->

  class HeaderLayoutView extends Marionette.Layout
    template: 'templates/header/header_template'

    regions:
      navigationRegion: '#navigation_region'
      formRegion: '#login_form_region'

    onRender: ->
      @navigationRegion.show(new HeaderNavigationView())
      @formRegion.show(new HeaderLoginFormView())

