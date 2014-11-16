App = require('scripts/application')
ContentLandingView = require('scripts/views/content/landing')

class LandingController extends Marionette.Controller
  index: ->
    App.mainRegion.show(new ContentLandingView)

module.exports = LandingController
