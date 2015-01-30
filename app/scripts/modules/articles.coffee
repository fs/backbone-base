App = require('scripts/application')
Router = require('scripts/routers/articles')
Controller = require('scripts/controllers/articles_controller')
Routes = require('scripts/helpers/routes')

class Articles extends Marionette.Module
  startWithParent: true

  onBeforeStart: ->
    controller = new Controller
    @router = new Router(controller: controller)
    Routes.initModule(@)

  onStart: ->
    console.log 'module articles started'

App.module('Articles', Articles)

module.exports = Articles
