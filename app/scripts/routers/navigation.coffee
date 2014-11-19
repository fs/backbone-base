App = require('scripts/application')
BaseRouter = require('scripts/routers/base')
Session = require('scripts/facades/session')
routes = require('scripts/helpers/routes')

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
