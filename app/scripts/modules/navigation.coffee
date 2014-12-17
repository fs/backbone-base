App = require('scripts/application')
Router = require('scripts/routers/navigation')
Controller = require('scripts/controllers/navigation_controller')

Navigation = App.module('Navigation')

Navigation.addInitializer ->
  controller = new Controller
  @router = new Router(controller: controller)

Navigation.on 'start', ->
  console.log 'module navigation started'

module.exports = Navigation
