define [
  'application'
  'marionette'
  'facades/session'
  'templates'
], (App, Marionette, Session) ->

  class HeaderLogoutView extends Marionette.ItemView
    className: 'nav navbar-nav navbar-right'
    template: JST['templates/header/logout']
    model: Session.currentUser()

    events:
      'click #logout_btn': 'onLogout'

    onLogout: ->
      App.vent.trigger('current_user:logout')
