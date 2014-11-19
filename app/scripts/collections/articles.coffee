AppCollection = require('scripts/collections/app')
Article = require('scripts/models/article')

class ArticleCollection extends AppCollection
  url: 'articles'
  model: Article

module.exports = ArticleCollection
