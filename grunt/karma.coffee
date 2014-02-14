module.exports = (grunt) ->
  unit:
    options:
      basePath: ''
      frameworks: ['mocha', 'requirejs', 'chai', 'sinon']
      runnerPort: 9999
      singleRun: true
      browsers: ['PhantomJS']
      files: [
        {pattern: 'public/bower_components/underscore/underscore.js', included: false},
        {pattern: 'public/bower_components/jquery/jquery.js', included: false},
        {pattern: 'public/bower_components/backbone/backbone.js', included: false},
        {pattern: 'public/bower_components/backbone-route-filter/backbone-route-filter.js', included: false},
        {pattern: 'public/bower_components/bootstrap/dist/js/bootstrap.js', included: false},
        {pattern: 'public/scripts/**/*.js', included: false},
        {pattern: 'specs/**/*spec.coffee', included: false},

        'specs/test-main.coffee'
      ]

      # list of files to exclude
      exclude: [
          'public/scripts/application.js'
          'public/scripts/config.js'
      ]
      reporters: ['dots', 'coverage']
      coverageReporter:
        type : 'html'
        dir : 'coverage/'
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
        'karma-coverage'
        'karma-coffee-preprocessor'
      ]
      client:
        mocha:
          ui: 'bdd'
