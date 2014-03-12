tests = []

for file of window.__karma__.files
  tests.push file if /_spec\.js$/.test(file)

require.config
  # Karma serves files from '/base'
  baseUrl: 'base/public/scripts'
  paths:
    'underscore': '../bower_components/underscore/underscore'
    'jquery': '../bower_components/jquery/jquery'
    'backbone': '../bower_components/backbone/backbone'
    'backbone.routefilter': '../bower_components/backbone-route-filter/backbone-route-filter'
    'bootstrap': '../bower_components/bootstrap/dist/js/bootstrap'

    'jade': '../vendor/scripts/runtime'

  shim:
    'underscore':
      exports: '_'
    'jquery':
      exports: '$'
    'backbone':
      deps: ['underscore', 'jquery']
      exports: 'Backbone'
    'backbone.routefilter':
      deps: ['backbone']
    'marionette':
      deps: ['backbone', 'backbone.routefilter']
      exports: 'Marionette'
    'bootstrap':
      deps: ['jquery']
    'templates':
      deps: ['jade']

  # ask Require.js to load these files (all our tests)
  deps: tests

  # start test run, once Require.js is done
  callback: window.__karma__.start
