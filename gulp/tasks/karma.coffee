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
      {pattern: "#{config.publicDir}/bower_components/**/*.js", included: false}
      {pattern: "#{config.publicDir}/vendor/**/*.js", included: false}
      {pattern: "#{config.appDir}/scripts/**/*.coffee", included: false}
      {pattern: "#{config.testDir}/**/*_spec.coffee", included: false}
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
      'karma-coffee-preprocessor'
    ]
    browserify:
      extensions: ['.coffee']
      transform: ['coffeeify']
    client:
      mocha:
        ui: 'bdd'
  , done)
