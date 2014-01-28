define [
  'Marionette'
  'Routes/main_router'
], (Marionette, Router) ->

  App = new Backbone.Marionette.Application()

  App.mainRoute = "main"

  App.addInitializer ->
    App.Router = new Router()

  App.navigate = (route, options) ->
    options or (options = {})
    Backbone.history.navigate(route, options)

  App.on 'initialize:after', () ->
    Backbone.history.start(pushState: true)
    console.log 'app started'

  App.start()
