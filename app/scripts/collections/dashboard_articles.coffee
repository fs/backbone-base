AppCollection = require('../collections/app.coffee')
DashboardArticle = require('../models/dashboard_article.coffee')

class DashboardArticles extends AppCollection
  url: '/api/dashboard'
  model: DashboardArticle

module.exports = DashboardArticles
