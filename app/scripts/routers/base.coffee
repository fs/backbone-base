Session = require('scripts/facades/session')
Routes = require('scripts/helpers/routes')

class BaseRouter extends Marionette.AppRouter
  before:
    'dashboard(/*path)': 'redirectIfNotLoggedIn'

  redirectIfNotLoggedIn: ->
    unless Session.isLoggedIn()
      @navigate(Routes.rootPath(), trigger: true)
      false

module.exports = BaseRouter
