AppCollection = require('../collections/app')
DashboardArticle = require('../models/dashboard_article')

class DashboardArticles extends AppCollection
  url: '/api/dashboard'
  model: DashboardArticle

module.exports = DashboardArticles
