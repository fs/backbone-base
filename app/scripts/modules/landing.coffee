App = require('../application.coffee')
Router = require('../routers/landing.coffee')
Controller = require('../controllers/landing_controller.coffee')

Landing = App.module('Landing')

Landing.addInitializer ->
  controller = new Controller
  @router = new Router(controller: controller)

Landing.on 'start', ->
  console.log 'module landing started'

module.exports = Landing
