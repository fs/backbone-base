define [
  'marionette'
  'views/header/header_navigation'
  'views/header/header_login_form'
], (Marionette, HeaderNavigationView, HeaderLoginFormView) ->

  class HeaderLayoutView extends Marionette.Layout
    className: 'container-fluid'
    template: JST['templates/header/header_layout']

    regions:
      navigationRegion: '#navigation_region'
      formRegion: '#login_form_region'

    onRender: ->
      @navigationRegion.show(new HeaderNavigationView)
      @formRegion.show(new HeaderLoginFormView)
