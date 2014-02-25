requirejs.config
  baseUrl: '/'
  deps: ['scripts/application']
  paths:
    #bower components
    'backbone': 'bower_components/backbone/backbone'
    'underscore': 'bower_components/underscore/underscore'
    'jquery': 'bower_components/jquery/jquery'
    'marionette': 'bower_components/marionette/lib/core/amd/backbone.marionette'
    'backbone.babysitter': 'bower_components/backbone.babysitter/lib/amd/backbone.babysitter'
    'backbone.wreqr': 'bower_components/backbone.wreqr/lib/amd/backbone.wreqr'
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
    'facades': 'scripts/facades'
    'helpers': 'scripts/helpers'
    'templates': 'scripts/templates'
  shim:
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
