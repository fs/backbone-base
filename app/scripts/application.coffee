requirejs [
  'marionette'
  'routes/main'
], (Marionette, Router) ->

  #doesn't work yet O_o 
  # Marionette.Renderer.render = (template, data) ->
  #   return unless template
  #   throw new Error("Template #{template} not found!") unless JST[template]
  #   return JST[template](data)

  App = new Marionette.Application()

  App.addInitializer ->
    App.Router = new Router()

  App.navigate = (route, options = {}) ->
    Backbone.history.navigate(route, options)

  App.on 'initialize:after', ->
    Backbone.history.start(pushState: true)
    console.log 'app started'

  App.start()
