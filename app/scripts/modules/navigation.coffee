App = require('scripts/application')
Router = require('scripts/routers/navigation')
Controller = require('scripts/controllers/navigation_controller')
Routes = require('scripts/helpers/routes')

class Navigation extends Marionette.Module
  startWithParent: true

  onBeforeStart: ->
    controller = new Controller
    @router = new Router(controller: controller)
    Routes.initModule(@)

  onStart: (options) ->
    console.log 'module navigation started'

App.module('Navigation', Navigation)

module.exports = Navigation
