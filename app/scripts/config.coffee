require.config
  baseUrl: '.'
  deps: ['scripts/app']
  paths:
    #bower_component
    'Backbone': 'bower_components/backbone/backbone'
    'Underscore': 'bower_components/underscore/underscore'
    'jQuery': 'bower_components/jquery/jquery'
    'Marionette': 'bower_components/marionette/lib/backbone.marionette'
    'Bootstrap': 'bower_components/sass-bootstrap/dist/js/bootstrap'
    #libs
    'jade': 'vendor/scripts/runtime'
    #application
    'Views': 'scripts/views'
    'Controllers': 'scripts/controllers'
    'Routes': 'scripts/routes'
    'Models': 'scripts/models'
    'Collections': 'scripts/collections'
    'Helpers': 'scripts/helpers'
    'Templates': 'scripts/templates'
  shim:
    'Marionette':
      deps: ['Backbone', 'Templates', 'Bootstrap']
    'Backbone':
      deps: ['jQuery', 'Underscore']
      exports: 'Backbone'
    'Bootstrap':
      deps: ['jQuery']
    'Templates':
      deps: ['jade']
    'Underscore':
      exports: '_'
    'jQuery':
      exports: '$'
