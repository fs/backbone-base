define [
  'collections/app'
  'models/article'
], (AppCollection, ArticleModel) ->

  class ArticleCollection extends AppCollection
    url: 'api/articles'
    model: ArticleModel
