tests = []

for file of window.__karma__.files
  tests.push file if /_spec\.js$/.test(file)

requirejs.config
  # Karma serves files from '/base'
  baseUrl: 'base/public/scripts'
  paths:
    'underscore': '../bower_components/underscore/underscore'
    'jquery': '../bower_components/jquery/jquery'
    'backbone': '../bower_components/backbone/backbone'
    'backbone.routefilter': '../bower_components/backbone-route-filter/backbone-route-filter'
    'backbone.stickit': '../bower_components/backbone.stickit/backbone.stickit'
    'backbone-validation': '../bower_components/backbone-validation/dist/backbone-validation-amd'
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
      deps: ['backbone', 'backbone.babysitter', 'backbone.wreqr', 'backbone.routefilter', 'backbone.stickit', 'backbone-validation']
    'bootstrap':
      deps: ['jquery']
    'templates':
      deps: ['jade']

  # ask Require.js to load these files (all our tests)
  deps: tests

  # start test run, once Require.js is done
  callback: window.__karma__.start
