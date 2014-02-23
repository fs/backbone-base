module.exports = (grunt) ->
  development: [
    '<%= grunt.publicDir %>/**/*'
  ]
  production: [
    '<%= grunt.productionDir %>/scripts'
    '<%= grunt.productionDir %>/stylesheets'
    '<%= grunt.productionDir %>/bower_components'
    '<%= grunt.productionDir %>/vendor'
  ]
