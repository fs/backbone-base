requirejs.config
  baseUrl: '/scripts'
  paths:
    'underscore': '../bower_components/underscore/underscore'
    'jquery': '../bower_components/jquery/jquery'
    'backbone': '../bower_components/backbone/backbone'
    'backbone.routefilter': '../bower_components/backbone-route-filter/backbone-route-filter'
    'backbone.stickit': '../bower_components/backbone.stickit/backbone.stickit'
    'backbone-validtion': '../bower_components/backbone-validation/dist/backbone-validation-amd'
    'backbone.babysitter': '../bower_components/backbone.babysitter/lib/backbone.babysitter'
    'backbone.wreqr': '../bower_components/backbone.wreqr/lib/backbone.wreqr'
    'marionette': '../bower_components/marionette/lib/core/amd/backbone.marionette'
    'bootstrap': '../bower_components/bootstrap/dist/js/bootstrap'

    'jade': '../vendor/scripts/runtime'
  shim:
    'underscore':
      exports: '_'
    'jquery':
      exports: '$'
    'backbone':
      deps: ['underscore', 'jquery', 'bootstrap']
    'backbone.routefilter':
      deps: ['backbone']
    'marionette':
      deps: ['backbone', 'backbone.babysitter', 'backbone.wreqr', 'backbone.routefilter', 'backbone.stickit', 'backbone-validtion']
    'bootstrap':
      deps: ['jquery']
    'templates':
      deps: ['jade']
