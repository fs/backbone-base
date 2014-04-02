define [
  'application'
  'routers/dashboard'
  'controllers/dashboard_controller'
], (App, Router, Controller) ->

  Dashboard = App.module('Dashboard')

  Dashboard.addInitializer ->
    controller = new Controller
    @router = new Router(controller: controller)

  Dashboard.on 'start', ->
    console.log 'module dashboard started'

  Dashboard
