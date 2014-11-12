App = require('../application')
Router = require('../routers/navigation')
Controller = require('../controllers/navigation_controller')

Navigation = App.module('Navigation')

Navigation.addInitializer ->
  controller = new Controller
  @router = new Router(controller: controller)

Navigation.on 'start', ->
  console.log 'module navigation started'

module.exports = Navigation
