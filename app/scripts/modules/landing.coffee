App = require('scripts/application')
Router = require('scripts/routers/landing')
Controller = require('scripts/controllers/landing_controller')
Routes = require('scripts/helpers/routes')

class Landing extends Marionette.Module
  startWithParent: true

  onBeforeStart: ->
    controller = new Controller
    @router = new Router(controller: controller)
    Routes.initModule(@)

  onStart: ->
    console.log 'module landing started'

App.module('Landing', Landing)

module.exports = Landing
