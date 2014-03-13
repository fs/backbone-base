define [
  'marionette'
  'routers/main'
], (Marionette, Router) ->

  App = new Marionette.Application()

  App.addInitializer ->
    @router = new Router

  App.on 'initialize:after', ->
    Backbone.history.start
      pushState: true
      root: '/'

    $(document).on 'click', '.js-link', (event) ->
      event.preventDefault()
      href = $(event.currentTarget).attr('href')
      App.router.navigate(href, trigger: true)

    console.log 'app started'

  App
