requirejs.config
  baseUrl: 'develop/js'
  paths:
    'Backbone': 'libs/backbone/backbone'
    'Underscore': 'libs/underscore/underscore'
    'jQuery': 'libs/jquery/jquery'
    'Marionette': 'libs/marionette/lib/backbone.marionette'
    'Backbone.Relational': 'libs/backbone-relational/backbone-relational'
    'Bootstrap': 'libs/sass-bootstrap/dist/js/bootstrap'
    'Views': 'views'
    'Controllers': 'controllers'
    'Routes': 'routes'
    'Models': 'models'
    'Collections': 'collections'
    'Templates': 'templates'
  shim:
    'Backbone':
      deps: ['jQuery', 'Underscore']
      exports: 'Backbone'
    'Backbone.Relational':
      deps: ['Backbone']
    'Marionette':
      deps: ['Backbone', 'Templates', 'Bootstrap']
    'Underscore':
      exports: '_'
    'jQuery':
      exports: '$'
    'Bootstrap':
      deps: ['jQuery']
  
requirejs ['Marionette', 'Routes/main_router'], (Marionette, Router) ->
  App = new Backbone.Marionette.Application()

  App.mainRoute = "main"

  App.addInitializer ->
    App.Router = new Router()

  App.on 'initialize:after', () ->
    Backbone.history.start
      pushState: true
      root: '/'
    console.log 'app started'

  App.start()
