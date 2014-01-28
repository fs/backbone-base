require.config
  baseUrl: 'js'
  deps: ['app']
  paths:
    #libs
    'Backbone': 'libs/backbone/backbone'
    'Underscore': 'libs/underscore/underscore'
    'jQuery': 'libs/jquery/jquery'
    'Marionette': 'libs/marionette/lib/backbone.marionette'
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
    'Marionette':
      deps: ['Backbone', 'Templates', 'Bootstrap']
    'Underscore':
      exports: '_'
    'jQuery':
      exports: '$'
    'Bootstrap':
      deps: ['jQuery']
