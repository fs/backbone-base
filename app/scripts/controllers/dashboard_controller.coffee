App = require('../application.coffee')
DashboardView = require('../views/dashboard/dashboard.coffee')
DashboardArticles = require('../collections/dashboard_articles.coffee')

class DashboardController extends Marionette.Controller
  index: ->
    articles = new DashboardArticles

    articles.fetch().then ->
      App.mainRegion.show(new DashboardView(collection: articles))

module.exports = DashboardController
