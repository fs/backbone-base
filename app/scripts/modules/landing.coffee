define [
  'application'
  'routers/landing'
], (App, LandingRouter) ->

  Landing = App.module('Landing')

  Landing.addInitializer ->
    @router = new LandingRouter

  Landing.on 'start', ->
    console.log 'module landing started'

  Landing
