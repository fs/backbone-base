App = require('../application')
BaseRouter = require('../routers/base')
Session = require('../facades/session')
routes = require('../helpers/routes')

class NavigationRouter extends BaseRouter
  initialize: ->
    @listenTo Session, 'create destroy', @onSessionChange
    @listenTo Backbone.history, 'route', @onNavigationChange

  onSessionChange: ->
    if Session.isLoggedIn()
      path = routes.dashboardPath()
    else
      path = routes.rootPath()

    @navigate(path, trigger: true)

  onNavigationChange: (router) ->
    App.vent.trigger 'navigation:change', router.navigation

module.exports = NavigationRouter
