requirejs.config({
  baseUrl: 'develop/js',
  shim: {
    'Backbone': {
      deps: ['jQuery', 'Underscore'],
      exports: 'Backbone'
    },
    'Backbone.Relational': {
      deps: ['Backbone']
    },
    'Marionette': {
      deps: ['Backbone']
    },
    'Underscore': {
      exports: '_'
    },
    'jQuery': {
      exports: '$'
    },
    'Bootstrap': {
      deps: ['jQuery']
    }
  },
  paths: {
    'Backbone': 'libs/backbone/backbone',
    'Underscore': 'libs/underscore/underscore',
    'jQuery': 'libs/jquery/jquery',
    'Marionette': 'libs/marionette/lib/backbone.marionette',
    'Backbone.Relational': 'libs/backbone-relational/backbone-relational',
    'Bootstrap': 'libs/sass-bootstrap/dist/js/bootstrap.js'
  }
});

requirejs(['Marionette'], function(Marionette) {
  return console.log('app started!');
});
