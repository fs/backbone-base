gulp = require('gulp')
karma = require('karma')
config = require('../config')

# Need to implement correct test environment with karma-browserify
gulp.task 'karma', ->
  karma.server.start(
    basePath: ''
    frameworks: ['mocha', 'browserify', 'chai', 'sinon']
    runnerPort: config.ports.test
    singleRun: true
    browsers: ['PhantomJS']
    files: [
      "./bower_components/jquery/dist/jquery.js"
      "./bower_components/underscore/underscore.js"
      "./bower_components/backbone/backbone.js"
      "./bower_components/backbone-route-filter/backbone-route-filter.js"
      "./bower_components/backbone.stickit/backbone.stickit.js"
      "./bower_components/backbone-validation/dist/backbone-validation.js"
      "./bower_components/marionette/lib/backbone.marionette.js"
      "./bower_components/bootstrap/dist/js/bootstrap.js"
      "./vendor/**/*.js"
      "./specs/**/*_spec.coffee"
    ]
    exclude: ['./bower_components/backbone-route-filter']
    reporters: ['dots']
    colors: true
    preprocessors:
      'specs/**/*.coffee': ['browserify']
    plugins: [
      'karma-mocha'
      'karma-chai'
      'karma-sinon'
      'karma-bro'
      'karma-chrome-launcher'
      'karma-phantomjs-launcher'
    ]
    browserify:
      extensions: ['.coffee']
    client:
      mocha:
        ui: 'bdd'
  )
