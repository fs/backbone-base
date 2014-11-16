AppCollection = require('scripts/collections/app')
Article = require('scripts/models/article')

class ArticleCollection extends AppCollection
  url: '/api/articles'
  model: Article

module.exports = ArticleCollection
