BaseRouter = require('../routers/base.coffee')

class LandingRouter extends BaseRouter
  appRoutes:
    '': 'index'

module.exports = LandingRouter
