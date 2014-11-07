App = require('../application.coffee')
NavigationLayout = require('../views/layouts/navigation_layout.coffee')

class NavigationController extends Marionette.Controller
  initialize: ->
    App.navigationRegion.show(new NavigationLayout)

module.exports = NavigationController
