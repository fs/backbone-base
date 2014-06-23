define [
  'marionette'
  'views/navigation/navigation'
  'views/navigation/login'
  'views/navigation/logout'
  'facades/session'
  'helpers/routes'
  'templates'
], (Marionette, NavigationNavigationView, NavigationLoginView, NavigationLogoutView, Session, Routes) ->

  class NavigationLayout extends Marionette.LayoutView
    className: 'container-fluid'
    template: JST['templates/layouts/navigation_layout']

    regions:
      navigationRegion: '#navigation_region'
      formRegion: '#login_form_region'

    templateHelpers:
      routes: Routes

    initialize: ->
      @listenTo Session, 'create destroy', @render

    onRender: ->
      if Session.isLoggedIn()
        navigationNavView = new NavigationNavigationView
        formRegionView = new NavigationLogoutView
        @navigationRegion.show(navigationNavView)
      else
        formRegionView = new NavigationLoginView
        @navigationRegion.empty()

      @formRegion.show(formRegionView)
