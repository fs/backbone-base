App = new Marionette.Application
AnimatedRegion = require('scripts/regions/animated_region')

App.addRegions
  notificationsRegion: '#notifications_region'
  navigationRegion: '#navigation_region'
  mainRegion:
    selector: '#main_region'
    regionClass: AnimatedRegion
    animation:
      showAnimation: [
        {
          p: {scale: 0}
          o: {duration: 0, display: 'none'}
        }
        {
          p: {scale: 1}
          o: {duration: 400, display: 'block'}
        }
      ]

App.navigate = (route, options) ->
  options or= {}
  Backbone.history.navigate(route, options)

App.on 'start', ->
  Backbone.history.start
    pushState: true
    root: '/'

  $(document).on 'click', '.js-link', (event) ->
    event.preventDefault()
    href = $(event.currentTarget).attr('href')
    App.navigate(href, trigger: true)

  console.log 'app started'

module.exports = App
