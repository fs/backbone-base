define [
  'application'
  'marionette'
  'facades/session'
  'templates'
], (App, Marionette, Session) ->

  class HeaderLogoutView extends Marionette.ItemView
    className: 'nav navbar-nav navbar-right'
    template: JST['templates/navigation/logout']
    model: Session.currentUser()

    events:
      'click #logout_btn': 'onLogout'

    onLogout: ->
      Session.destroy()
