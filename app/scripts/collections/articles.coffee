AppCollection = require('scripts/collections/app')
Article = require('scripts/models/article')

class Articles extends AppCollection
  url: 'articles'
  model: Article

module.exports = Articles
