define [
  'marionette'
  'views/header/navigation'
  'views/header/login'
  'views/header/logout'
  'facades/session'
  'helpers/routes'
  'templates'
], (Marionette, HeaderNavigationView, HeaderLoginView, HeaderLogoutView, Session, Routes) ->

  class HeaderLayout extends Marionette.Layout
    className: 'container-fluid'
    template: JST['templates/layouts/header_layout']

    regions:
      navigationRegion: '#navigation_region'
      formRegion: '#login_form_region'

    templateHelpers:
      routes: Routes

    initialize: ->
      @listenTo Session, 'create destroy', @render

    onRender: ->
      if Session.isLoggedIn()
        headerNavView = new HeaderNavigationView
        formRegionView = new HeaderLogoutView
        @navigationRegion.show(headerNavView)
      else
        formRegionView = new HeaderLoginView
        @navigationRegion.close()

      @formRegion.show(formRegionView)
