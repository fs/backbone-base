App = require('../application.coffee')
Router = require('../routers/articles.coffee')
Controller = require('../controllers/articles_controller.coffee')

Articles = App.module('Articles')

Articles.addInitializer ->
  controller = new Controller
  @router = new Router(controller: controller)

Articles.on 'start', ->
  console.log 'module articles started'

module.exports = Articles
