module.exports = (grunt) ->
  unit:
    options:
      basePath: ''
      frameworks: ['mocha', 'requirejs', 'chai', 'sinon']
      runnerPort: 9999
      singleRun: true
      browsers: ['PhantomJS']
      files: [
        {pattern: '<%= grunt.publicDir %>/bower_components/**/*.js', included: false}
        {pattern: '<%= grunt.publicDir %>/vendor/**/*.js', included: false}
        {pattern: '<%= grunt.publicDir %>/scripts/**/*.js', included: false}
        {pattern: '<%= grunt.testDir %>/**/*_spec.coffee', included: false}
        '<%= grunt.testDir %>/runner.coffee'
      ]
      exclude: [
        '<%= grunt.publicDir %>/scripts/config.js'
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
