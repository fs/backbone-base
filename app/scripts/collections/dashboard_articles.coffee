define [
  'collections/app'
  'models/dashboard_article'
], (AppCollection, DashboardArticle) ->

  class DashboardArticles extends AppCollection
    url: '/api/dashboard'
    model: DashboardArticle
