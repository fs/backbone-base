NavigationNavigationView = require('scripts/views/navigation/navigation')
NavigationLoginView = require('scripts/views/navigation/login')
NavigationLogoutView = require('scripts/views/navigation/logout')
Session = require('scripts/facades/session')
Routes = require('scripts/helpers/routes')
template = require('templates/layouts/navigation_layout')

class NavigationLayout extends Marionette.LayoutView
  className: 'container-fluid'
  template: template

  regions:
    navigationRegion: '#navigations_region'
    formRegion: '#login_form_region'

  templateHelpers:
    routes: Routes

  initialize: ->
    Routes.init()
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

module.exports = NavigationLayout
