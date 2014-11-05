App = require('../application.coffee')
BaseRouter = require('../routers/base.coffee')
Session = require('../facades/session.coffee')
Routes = require('../helpers/routes.coffee')

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
