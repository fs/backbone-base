require.config
  baseUrl: '.'
  deps: ['js/app']
  paths:
    #libs
    'Backbone': 'bower_components/backbone/backbone'
    'Underscore': 'bower_components/underscore/underscore'
    'jQuery': 'bower_components/jquery/jquery'
    'Marionette': 'bower_components/marionette/lib/backbone.marionette'
    'Bootstrap': 'bower_components/sass-bootstrap/dist/js/bootstrap'
    #application
    'Views': 'js/views'
    'Controllers': 'js/controllers'
    'Routes': 'js/routes'
    'Models': 'js/models'
    'Collections': 'js/collections'
    'Templates': 'js/templates'
  shim:
    'Backbone':
      deps: ['jQuery', 'Underscore']
      exports: 'Backbone'
    'Marionette':
      deps: ['Backbone', 'Templates', 'Bootstrap']
    'Underscore':
      exports: '_'
    'jQuery':
      exports: '$'
    'Bootstrap':
      deps: ['jQuery']
