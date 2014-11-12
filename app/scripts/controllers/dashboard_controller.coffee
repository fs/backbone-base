App = require('../application')
DashboardView = require('../views/dashboard/dashboard')
DashboardArticles = require('../collections/dashboard_articles')

class DashboardController extends Marionette.Controller
  index: ->
    articles = new DashboardArticles

    articles.fetch().then ->
      App.mainRegion.show(new DashboardView(collection: articles))

module.exports = DashboardController
