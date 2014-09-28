define [
  'collections/app'
  'helpers/config_helper'
  'models/dashboard_article'
], (
  AppCollection
  Config
  DashboardArticle
) ->

  class DashboardArticles extends AppCollection
    url: "#{Config.getUrl()}/dashboard"
    model: DashboardArticle
