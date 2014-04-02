define [
  'application'
  'routers/articles'
  'controllers/articles_controller'
], (App, Router, Controller) ->

  Articles = App.module('Articles')

  Articles.addInitializer ->
    controller = new Controller
    @router = new Router(controller: controller)

  Articles.on 'start', ->
    console.log 'module articles started'

  Articles
