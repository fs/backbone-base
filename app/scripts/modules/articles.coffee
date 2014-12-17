App = require('scripts/application')
Router = require('scripts/routers/articles')
Controller = require('scripts/controllers/articles_controller')

Articles = App.module('Articles')

Articles.addInitializer ->
  controller = new Controller
  @router = new Router(controller: controller)

Articles.on 'start', ->
  console.log 'module articles started'

module.exports = Articles
