BaseRouter = require('../routers/base')

class ArticlesRouter extends BaseRouter
  navigation: 'articles'

  appRoutes:
    'dashboard/articles': 'index'
    'dashboard/articles/:id': 'show'

module.exports = ArticlesRouter
