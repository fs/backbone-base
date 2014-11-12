Marionette = require('marionette')
App = require('../application')
Session = require('../facades/session')
Routes = require('../helpers/routes')

class BaseRouter extends Marionette.AppRouter
  before:
    'dashboard(/*path)': 'redirectIfNotLoggedIn'

  redirectIfNotLoggedIn: ->
    unless Session.isLoggedIn()
      @navigate(Routes.rootPath(), trigger: true)
      false

module.exports = BaseRouter
