require.config
  baseUrl: '.'
  deps: ['scripts/application']
  paths:
    'backbone': '../vendor/bower_components/backbone/backbone'
    'underscore': '../vendor/bower_components/underscore/underscore'
    'jquery': '../vendor/bower_components/jquery/jquery'
    'marionette': '../vendor/bower_components/marionette/lib/backbone.marionette'
    'bootstrap': '../vendor/bower_components/sass-bootstrap/dist/js/bootstrap'
    'jade': '../vendor/scripts/runtime'
    'views': 'scripts/views'
    'controllers': 'scripts/controllers'
    'routes': 'scripts/routes'
    'models': 'scripts/models'
    'collections': 'scripts/collections'
    'helpers': 'scripts/helpers'
    'templates': 'scripts/templates'
  shim:
    'marionette':
      deps: ['backbone', 'templates', 'bootstrap']
      exports: 'Marionette'
    'backbone':
      deps: ['jquery', 'underscore']
      exports: 'Backbone'
    'bootstrap':
      deps: ['jquery']
    'templates':
      deps: ['jade']
    'underscore':
      exports: '_'
    'jquery':
      exports: '$'
