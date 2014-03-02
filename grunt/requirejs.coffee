module.exports = (grunt) ->
  production:
    options:
      baseUrl: '<%= grunt.publicDir %>'
      mainConfigFile: '<%= grunt.publicDir %>/scripts/config.js'
      out: '<%= grunt.productionDir %>/application.js'
      preserveLicenseComments: false
      findNestedDependencies: true
      wrapShim: true
      include: ['bower_components/almond/almond']
      optimize: 'uglify2'
      uglify2:
        output:
          beautify: false
        compress:
          global_defs:
            DEBUG: false
