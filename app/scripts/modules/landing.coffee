define [
  'application'
  'routers/landing'
  'controllers/landing_controller'
], (App, Router, Controller) ->

  Landing = App.module('Landing')

  Landing.addInitializer ->
    controller = new Controller
    @router = new Router(controller: controller)

  Landing.on 'start', ->
    console.log 'module landing started'

  Landing
