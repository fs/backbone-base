define [
  'controllers/base_controller'
  'views/dashboard/dashboard'
  'collections/dashboard_articles'
], (BaseController, DashboardView, DashboardArticles) ->

  class DashboardController extends BaseController
    index: ->
      articles = new DashboardArticles

      articles.fetch().then =>
        @layout.mainRegion.show(new DashboardView(collection: articles))
