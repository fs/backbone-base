define [
  'application'
  'routers/header'
], (App, HeaderRouter) ->

  Header = App.module('Header')

  Header.addInitializer ->
    @router = new HeaderRouter

  Header.on 'start', ->
    console.log 'module header started'

  Header
