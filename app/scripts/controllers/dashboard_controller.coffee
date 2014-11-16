App = require('scripts/application')
DashboardView = require('scripts/views/dashboard/dashboard')
DashboardArticles = require('scripts/collections/dashboard_articles')

class DashboardController extends Marionette.Controller
  index: ->
    articles = new DashboardArticles

    articles.fetch().then ->
      App.mainRegion.show(new DashboardView(collection: articles))

module.exports = DashboardController
