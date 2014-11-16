AppCollection = require('scripts/collections/app')
DashboardArticle = require('scripts/models/dashboard_article')

class DashboardArticles extends AppCollection
  url: '/api/dashboard'
  model: DashboardArticle

module.exports = DashboardArticles
