require.config
  baseUrl: 'develop/js'
  deps: ['app']
  paths:
    #libs
    'Backbone': 'libs/backbone/backbone'
    'Underscore': 'libs/underscore/underscore'
    'jQuery': 'libs/jquery/jquery'
    'Marionette': 'libs/marionette/lib/backbone.marionette'
    'Backbone.Relational': 'libs/backbone-relational/backbone-relational'
    'Bootstrap': 'libs/sass-bootstrap/dist/js/bootstrap'
    #application
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
