App = require('../application.coffee')
Router = require('../routers/navigation.coffee')
Controller = require('../controllers/navigation_controller.coffee')

Navigation = App.module('Navigation')

Navigation.addInitializer ->
  controller = new Controller
  @router = new Router(controller: controller)

Navigation.on 'start', ->
  console.log 'module navigation started'

module.exports = Navigation
