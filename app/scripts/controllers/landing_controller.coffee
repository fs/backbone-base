App = require('../application.coffee')
ContentLandingView = require('../views/content/landing.coffee')

class LandingController extends Marionette.Controller
  index: ->
    App.mainRegion.show(new ContentLandingView)

module.exports = LandingController
