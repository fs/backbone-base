AppConfig = require('scripts/config')

App = new Marionette.Application

App.history = ->
  Backbone.history.start(pushState: true, root: AppConfig.rootPath)

App.follow = (event) ->
  event.preventDefault()
  href = $(event.currentTarget).attr('href')
  Backbone.history.navigate(href, trigger: true)

App.events = ->
  $(document).on 'click', '.js-link', App.follow

App.addRegions
  navigationRegion: '#navigation_region'
  mainRegion: '#main_region'

App.on 'start', ->
  App.history()
  App.events()
  console.log 'app started'

module.exports = App
