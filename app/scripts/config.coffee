requirejs.config
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
    'Templates': 'scripts/templates'
    'Storage': 'scripts/facades/storage'
  shim:
    'Marionette':
      deps: ['Backbone', 'Templates', 'Bootstrap', 'Storage']
    'Backbone':
      exports: 'Backbone'
      deps: ['jQuery', 'Underscore']
    'Bootstrap':
      deps: ['jQuery']
    'Templates':
      deps: ['jade']
    'Underscore':
      exports: '_'
    'jQuery':
      exports: '$'
