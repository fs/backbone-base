NavigationNavigationView = require('../../views/navigation/navigation')
NavigationLoginView = require('../../views/navigation/login')
NavigationLogoutView = require('../../views/navigation/logout')
Session = require('../../facades/session')
Routes = require('../../helpers/routes')
template = require('../../../templates/layouts/navigation_layout')

class NavigationLayout extends Marionette.LayoutView
  className: 'container-fluid'
  template: template

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

module.exports = NavigationLayout
