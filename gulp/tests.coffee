gulp = require('gulp')
config = require('./config')
karma = require('karma').server

module.exports = (done) ->
  karma.start(
    basePath: ''
    frameworks: ['mocha', 'requirejs', 'chai', 'sinon']
    runnerPort: config.ports.test
    singleRun: true
    browsers: ['PhantomJS']
    files: [
      {pattern: "#{config.publicDir}/bower_components/**/*.js", included: false}
      {pattern: "#{config.publicDir}/vendor/**/*.js", included: false}
      {pattern: "#{config.publicDir}/scripts/**/*.js", included: false}
      {pattern: "#{config.testDir}/**/*_spec.coffee", included: false}
      "#{config.testDir}/runner.coffee"
    ]
    exclude: [
      "#{config.publicDir}/scripts/config.js"
    ]
    reporters: ['dots']
    colors: true
    preprocessors:
      'specs/**/*.coffee': ['coffee']
    plugins: [
      'karma-mocha'
      'karma-chai'
      'karma-sinon'
      'karma-requirejs'
      'karma-chrome-launcher'
      'karma-phantomjs-launcher'
      'karma-coffee-preprocessor'
    ]
    client:
      mocha:
        ui: 'bdd'
  , done)
