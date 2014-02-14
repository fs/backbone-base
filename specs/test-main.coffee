tests = []
for file of window.__karma__.files
  tests.push file  if /spec\.js$/.test(file)
requirejs.config
  # Karma serves files from '/base'
  baseUrl: 'base/public'
  paths:
    'underscore': 'bower_components/underscore/underscore'
    'jquery': 'bower_components/jquery/jquery'
    'backbone': 'bower_components/backbone/backbone'
    'backbone.routefilter': 'bower_components/backbone-route-filter/backbone-route-filter'
    'backbone.wreqr': 'bower_components/backbone.wreqr/lib/backbone.wreqr'
    'bootstrap': 'bower_components/bootstrap/dist/js/bootstrap'

    'jade': 'vendor/scripts/runtime'

    'views': 'scripts/views'
    'controllers': 'scripts/controllers'
    'routers': 'scripts/routers'
    'models': 'scripts/models'
    'collections': 'scripts/collections'
    'facades': 'scripts/facades'
    'helpers': 'scripts/helpers'
    'templates': 'scripts/templates'

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
