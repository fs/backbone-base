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
      {pattern: "./bower_components/**/*.js", included: false}
      {pattern: "./vendor/**/*.js", included: false}
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
