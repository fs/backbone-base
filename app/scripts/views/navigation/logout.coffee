Session = require('../../facades/session.coffee')
template = require('../../../templates/navigation/logout.jade')

class NavigationLogoutView extends Marionette.ItemView
  className: 'nav navbar-nav navbar-right'
  template: template
  model: Session.currentUser()

  events:
    'click #logout_btn': 'onLogout'

  onLogout: ->
    Session.destroy()

module.exports = NavigationLogoutView
