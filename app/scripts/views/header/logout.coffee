define [
  'marionette'
  'facades/session'
  'helpers/routes'
  'templates'
], (Marionette, Session, Routes) ->

  class HeaderLogoutView extends Marionette.ItemView
    className: 'nav navbar-nav navbar-right'
    template: JST['templates/header/logout']
    model: Session.currentUser()

    templateHelpers:
      routes: Routes

