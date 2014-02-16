requirejs.config
  baseUrl: '/'
  deps: ['scripts/application']
  paths:
    #bower components
    'backbone': 'bower_components/backbone/backbone'
    'underscore': 'bower_components/underscore/underscore'
    'jquery': 'bower_components/jquery/jquery'
    'marionette': 'bower_components/marionette/lib/backbone.marionette'
    'bootstrap': 'bower_components/bootstrap/dist/js/bootstrap'
    'backbone.routefilter': 'bower_components/backbone-route-filter/backbone-route-filter'
    #vendor
    'jade': 'vendor/scripts/runtime'
    #application
    'views': 'scripts/views'
    'controllers': 'scripts/controllers'
    'routers': 'scripts/routers'
    'models': 'scripts/models'
    'collections': 'scripts/collections'
    'templates': 'scripts/templates'
    'storage': 'scripts/facades/storage'
    'events': 'scripts/helpers/event_aggregator'
  shim:
    'marionette':
      deps: ['backbone', 'backbone.routefilter', 'templates', 'bootstrap', 'storage']
      exports: 'Marionette'
    'backbone':
      deps: ['jquery', 'underscore']
      exports: 'Backbone'
    'backbone.routefilter':
      deps: ['backbone']
    'bootstrap':
      deps: ['jquery']
    'templates':
      deps: ['jade']
    'underscore':
      exports: '_'
    'jquery':
      exports: '$'
