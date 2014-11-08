BaseRouter = require('../routers/base.coffee')

class DashboardRouter extends BaseRouter
  navigation: 'dashboard'

  appRoutes:
    'dashboard': 'index'

module.exports = DashboardRouter
