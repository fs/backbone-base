module.exports = (config) ->
  config.set
    basePath: ''
    frameworks: ['mocha', 'requirejs', 'chai', 'sinon']
    runnerPort: 9999
    singleRun: true
    browsers: ['PhantomJS']
    files: [
      {pattern: 'public/bower_components/**/*.js', included: false}
      {pattern: 'public/vendor/**/*.js', included: false}
      {pattern: 'public/scripts/**/*.js', included: false}
      {pattern: 'specs/**/*_spec.coffee', included: false}
      'specs/runner.coffee'
    ]
    exclude: [
      'public/scripts/config.js'
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
