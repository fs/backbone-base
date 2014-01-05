requirejs.config
  baseUrl: 'develop/js'
  paths:
    'Backbone': 'libs/backbone/backbone'
    'Underscore': 'libs/underscore/underscore'
    'jQuery': 'libs/jquery/jquery'
    'Marionette': 'libs/marionette/lib/backbone.marionette'
    'Backbone.Relational': 'libs/backbone-relational/backbone-relational'
    'Bootstrap': 'libs/sass-bootstrap/dist/js/bootstrap.js'
    'Views': 'views'
    'Models': 'models'
    'Routes': 'routes'
    'Collections': 'collections'
    'Controllers': 'controllers'
    'Templates': 'templates'
  shim:
    'Backbone':
      deps: ['jQuery', 'Underscore']
      exports: 'Backbone'
    'Backbone.Relational':
      deps: ['Backbone']
    'Marionette':
      deps: ['Backbone', 'Templates']
    'Underscore':
      exports: '_'
    'jQuery':
      exports: '$'
    'Bootstrap':
      deps: ['jQuery']
  
requirejs ['Marionette', 'Views/layout_view'], (Marionette, LayoutView) ->
  App = new Backbone.Marionette.Application()

  App.mainRoute = "main"
  
  App.addRegions
    regionMain: "body"

  App.addInitializer ->
    layout = new LayoutView()
    App.regionMain.show(layout);

  App.on 'initialize:after', () ->
    Backbone.history.start
      pushState: true
    console.log 'app started'

  App.start()
