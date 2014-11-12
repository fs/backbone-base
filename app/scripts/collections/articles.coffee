AppCollection = require('../collections/app')
Article = require('../models/article')

class ArticleCollection extends AppCollection
  url: '/api/articles'
  model: Article

module.exports = ArticleCollection
