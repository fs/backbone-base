gulp = require('gulp')
karma = require('karma')
remapify = require('remapify')
config = require('../config')

gulp.task 'karma', ->
  karma.server.start(
    basePath: ''
    frameworks: ['mocha', 'browserify', 'chai', 'sinon']
    runnerPort: config.ports.test
    singleRun: true
    browsers: ['PhantomJS']
    files: [
      './bower_components/jquery/dist/jquery.js'
      './bower_components/underscore/underscore.js'
      './bower_components/backbone/backbone.js'
      './bower_components/backbone-route-filter/backbone-route-filter.js'
      './bower_components/backbone.stickit/backbone.stickit.js'
      './bower_components/backbone-validation/dist/backbone-validation.js'
      './bower_components/marionette/lib/backbone.marionette.js'
      './bower_components/bootstrap/dist/js/bootstrap.js'
      './vendor/**/*.js'
      './specs/**/*_spec.coffee'
    ]
    reporters: ['dots']
    colors: true
    preprocessors:
      'specs/**/*.coffee': ['browserify']
    plugins: [
      'karma-mocha'
      'karma-chai'
      'karma-sinon'
      'karma-browserify'
      'karma-chrome-launcher'
      'karma-phantomjs-launcher'
    ]
    browserify:
      extensions: ['.coffee']
      transform: ['browserify-shim', 'coffeeify']
      prebundle: (bundle) ->
        bundle.plugin(remapify, [
          src: '**/*.coffee'
          expose: 'scripts'
          cwd: './app/scripts'
        ])
    client:
      mocha:
        ui: 'bdd'
  )
