AppCollection = require('../collections/app.coffee')
Article = require('../models/article.coffee')

class ArticleCollection extends AppCollection
  url: '/api/articles'
  model: Article

module.exports = ArticleCollection
