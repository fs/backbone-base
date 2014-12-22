App = require('scripts/application')
Router = require('scripts/routers/articles')
Controller = require('scripts/controllers/articles_controller')

class Articles extends Marionette.Module
  startWithParent: true

  onBeforeStart: ->
    controller = new Controller
    @router = new Router(controller: controller)

  onStart: ->
    console.log 'module articles started'

App.module('Articles', Articles)

module.exports = Articles
