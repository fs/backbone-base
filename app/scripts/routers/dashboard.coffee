BaseRouter = require('../routers/base')

class DashboardRouter extends BaseRouter
  navigation: 'dashboard'

  appRoutes:
    'dashboard': 'index'

module.exports = DashboardRouter
