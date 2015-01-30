App = require('scripts/application')
Router = require('scripts/routers/dashboard')
Controller = require('scripts/controllers/dashboard_controller')
Routes = require('scripts/helpers/routes')

class Dashboard extends Marionette.Module
  startWithParent: true

  onBeforeStart: ->
    controller = new Controller
    @router = new Router(controller: controller)
    Routes.initModule(@)

  onStart: ->
    console.log 'module dashboard started'

App.module('Dashboard', Dashboard)

module.exports = Dashboard
