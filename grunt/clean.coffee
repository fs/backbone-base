module.exports = (grunt) ->
  development: [
    '<%= grunt.publicDir %>/**/*'
    'access_logs.db'
  ]
  production: [
    '<%= grunt.productionDir %>/scripts'
    '<%= grunt.productionDir %>/stylesheets'
    '<%= grunt.productionDir %>/bower_components'
    '<%= grunt.productionDir %>/vendor'
  ]
  beforeCompile: [
    '<%= grunt.productionDir %>/**/*'
  ]
