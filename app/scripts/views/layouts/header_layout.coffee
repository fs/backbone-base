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
    model: Session.currentUser()

    regions:
      navigationRegion: '#navigation_region'
      formRegion: '#login_form_region'

    modelEvents:
      'change': 'render'

    templateHelpers:
      routes: Routes

    onRender: ->
      if Session.isLoggedIn()
        @headerNavView = new HeaderNavigationView
        @navigationRegion.show(@headerNavView)
        @formRegion.show(new HeaderLogoutView)
      else
        @navigationRegion.close()
        @formRegion.show(new HeaderLoginView)
