requirejs.config
  baseUrl: '/scripts'
  paths:
    'jquery': '../bower_components/jquery/dist/jquery'
    'underscore': '../bower_components/underscore/underscore'
    'backbone': '../bower_components/backbone/backbone'
    'backbone.routefilter': '../bower_components/backbone-route-filter/backbone-route-filter'
    'backbone.stickit': '../bower_components/backbone.stickit/backbone.stickit'
    'backbone-validation': '../bower_components/backbone-validation/dist/backbone-validation-amd'
    'marionette': '../bower_components/marionette/lib/backbone.marionette'
    'bootstrap': '../bower_components/bootstrap/dist/js/bootstrap'

    'jade': '../vendor/scripts/runtime'
  shim:
    'underscore':
      exports: '_'
    'jquery':
      exports: '$'
    'backbone':
      deps: [
        'underscore'
        'jquery'
        'bootstrap'
      ]
    'backbone.routefilter':
      deps: ['backbone']
    'marionette':
      deps: [
        'backbone'
        'backbone.routefilter'
        'backbone.stickit'
        'backbone-validation'
      ]
    'bootstrap':
      deps: ['jquery']
    'templates':
      deps: ['jade']
