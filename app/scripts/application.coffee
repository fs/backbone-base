requirejs [
  'marionette'
  'routes/main'
], (Marionette, Router) ->

  App = new Marionette.Application()

  App.addInitializer ->
    App.Router = new Router()

  App.navigate = (route, options = {}) ->
    Backbone.history.navigate(route, options)

  App.on 'initialize:after', ->
    Backbone.history.start(pushState: true)
    $(document).on 'click', '.js-link', (event) ->
      event.preventDefault()
      href = $(event.currentTarget).attr('href')
      App.Router.navigate(href, {trigger: true})
    console.log 'app started'

  App.start()
