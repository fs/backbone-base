define [
  'collections/app'
  'models/article'
], (AppCollection, Article) ->

  class ArticleCollection extends AppCollection
    url: 'api/articles'
    model: Article
