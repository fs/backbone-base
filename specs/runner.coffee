tests = []

for file of window.__karma__.files
  tests.push file if /_spec\.js$/.test(file)

requirejs.config
  # Karma serves files from '/base'
  baseUrl: 'base/public/scripts'
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
    'bootstrap':
      deps: ['jquery']
    'marionette':
      deps: [
        'backbone'
        'backbone.routefilter'
        'backbone.stickit'
        'backbone-validation'
        'bootstrap'
      ]
    'templates':
      deps: ['jade']

  # ask Require.js to load these files (all our tests)
  deps: tests

  # start test run, once Require.js is done
  callback: window.__karma__.start
