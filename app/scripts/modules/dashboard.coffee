App = require('../application')
Router = require('../routers/dashboard')
Controller = require('../controllers/dashboard_controller')

Dashboard = App.module('Dashboard')

Dashboard.addInitializer ->
  controller = new Controller
  @router = new Router(controller: controller)

Dashboard.on 'start', ->
  console.log 'module dashboard started'

module.exports = Dashboard
