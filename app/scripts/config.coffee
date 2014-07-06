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
    'flat-ui.controls': '../bower_components/flat-ui/js/custom_checkbox_and_radio'

    'jade': '../vendor/scripts/runtime'
  shim:
    'flat-ui.controls':
      deps: ['jquery']
    'bootstrap':
      deps: [
        'jquery'
        'flat-ui.controls'
      ]
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
