define [
  'application'
  'routers/dashboard'
], (App, DashboardRouter) ->

  Dashboard = App.module('Dashboard')

  Dashboard.addInitializer ->
    @router = new DashboardRouter

  Dashboard.on 'start', ->
    console.log 'module dashboard started'

  Dashboard
