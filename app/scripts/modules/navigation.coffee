define [
  'application'
  'routers/navigation'
  'controllers/navigation_controller'
], (App, Router, Controller) ->

  Navigation = App.module('Navigation')

  Navigation.addInitializer ->
    controller = new Controller
    @router = new Router(controller: controller)

  Navigation.on 'start', ->
    console.log 'module navigation started'

  Navigation
