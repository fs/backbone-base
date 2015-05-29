AppConfig = require('scripts/config')
LinkOverride = require('scripts/overrides/link')

App = new Marionette.Application

App.history = ->
  Backbone.history.start(pushState: true, root: AppConfig.rootPath)

App.addRegions
  navigationRegion: '#navigation_region'
  mainRegion: '#main_region'

App.on 'start', ->
  App.history()
  LinkOverride.init()
  console.log 'app started'

module.exports = App
