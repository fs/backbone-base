Marionette = require('marionette')
App = require('../application.coffee')
Session = require('../facades/session.coffee')
Routes = require('../helpers/routes.coffee')

class BaseRouter extends Marionette.AppRouter
  before:
    'dashboard(/*path)': 'redirectIfNotLoggedIn'

  redirectIfNotLoggedIn: ->
    unless Session.isLoggedIn()
      @navigate(Routes.rootPath(), trigger: true)
      false

module.exports = BaseRouter
