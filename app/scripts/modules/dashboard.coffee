App = require('../application.coffee')
Router = require('../routers/dashboard.coffee')
Controller = require('../controllers/dashboard_controller.coffee')

Dashboard = App.module('Dashboard')

Dashboard.addInitializer ->
  controller = new Controller
  @router = new Router(controller: controller)

Dashboard.on 'start', ->
  console.log 'module dashboard started'

module.exports = Dashboard
