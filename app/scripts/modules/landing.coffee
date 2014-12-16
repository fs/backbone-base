App = require('scripts/application')
Router = require('scripts/routers/landing')
Controller = require('scripts/controllers/landing_controller')

Landing = App.module('Landing')

Landing.addInitializer ->
  controller = new Controller
  @router = new Router(controller: controller)

Landing.on 'start', ->
  console.log 'module landing started'

module.exports = Landing
