App = require('scripts/application')
Router = require('scripts/routers/navigation')
Controller = require('scripts/controllers/navigation_controller')

class Navigation extends Marionette.Module
  startWithParent: true

  onBeforeStart: ->
    controller = new Controller
    @router = new Router(controller: controller)

  onStart: (options) ->
    console.log 'module navigation started'

App.module('Navigation', Navigation)

module.exports = Navigation
