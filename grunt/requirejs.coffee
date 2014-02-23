module.exports = (grunt) ->
  production:
    options:
      name: 'scripts/config'
      preserveLicenseComments: false
      findNestedDependencies: true
      optimize: 'uglify2'
      uglify2:
        output:
          beautify: false
        compress:
          global_defs:
            DEBUG: false
      baseUrl: '<%= grunt.productionDir %>'
      mainConfigFile: '<%= grunt.productionDir %>/scripts/config.js'
      out: '<%= grunt.productionDir %>/application.js'
      # removeCombined: false
