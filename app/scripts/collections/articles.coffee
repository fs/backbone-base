define [
  'collections/app'
  'models/article'
], (AppCollection, ArticleModel) ->

  class ArticleCollection extends AppCollection
    url: 'api/articles.json'
    model: ArticleModel
