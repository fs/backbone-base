define [
  'collections/app'
  'helpers/config_helper'
  'models/article'
], (
  AppCollection
  Config
  Article
) ->

  class ArticleCollection extends AppCollection
    url: "#{Config.getUrl()}/articles"
    model: Article
