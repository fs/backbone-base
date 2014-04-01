define [
  'application'
  'routers/navigation'
], (App, NavigationRouter) ->

  Navigation = App.module('Navigation')

  Navigation.addInitializer ->
    @router = new NavigationRouter

  Navigation.on 'start', ->
    console.log 'module navigation started'

  Navigation
