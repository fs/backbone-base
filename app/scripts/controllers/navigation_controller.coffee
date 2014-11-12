App = require('../application')
NavigationLayout = require('../views/layouts/navigation_layout')

class NavigationController extends Marionette.Controller
  initialize: ->
    App.navigationRegion.show(new NavigationLayout)

module.exports = NavigationController
