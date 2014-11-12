App = require('../application')
ContentLandingView = require('../views/content/landing')

class LandingController extends Marionette.Controller
  index: ->
    App.mainRegion.show(new ContentLandingView)

module.exports = LandingController
