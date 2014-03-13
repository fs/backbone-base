module.exports = (grunt) ->
  production:
    options:
      baseUrl: '<%= grunt.publicDir %>/scripts'
      mainConfigFile: '<%= grunt.publicDir %>/scripts/config.js'
      out: '<%= grunt.productionDir %>/application.js'
      preserveLicenseComments: false
      findNestedDependencies: true
      wrapShim: true
      include: ['main']
      name: '../bower_components/almond/almond'
      optimize: 'uglify2'
      uglify2:
        output:
          beautify: false
        compress:
          global_defs:
            DEBUG: false
