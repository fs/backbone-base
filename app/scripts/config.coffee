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
    #application
    'Views': 'scripts/views'
    'Controllers': 'scripts/controllers'
    'Routes': 'scripts/routes'
    'Models': 'scripts/models'
    'Collections': 'scripts/collections'
    'Templates': 'scripts/templates'
    #tests
    'add-one': 'scripts/add-one'
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
