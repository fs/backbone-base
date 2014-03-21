define [
  'application'
  'views/dashboard/dashboard'
  'collections/dashboard_articles'
], (App, DashboardView, DashboardArticles) ->

  class DashboardController extends Marionette.Controller
    index: ->
      articles = new DashboardArticles

      articles.fetch().then ->
        App.mainRegion.show(new DashboardView(collection: articles))
