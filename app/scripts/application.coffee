AppConfig = require('scripts/config')

App = new Marionette.Application

App.addRegions
  navigationRegion: '#navigation_region'
  mainRegion: '#main_region'

App.on 'start', ->
  Backbone.history.start(pushState: true, root: AppConfig.rootPath)
  console.log 'app started'

module.exports = App
