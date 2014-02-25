module.exports = (grunt) ->
  development: [
    '<%= grunt.publicDir %>/**/*'
    'access_logs.db'
  ]
  production: [
    '<%= grunt.productionDir %>/**/*'
  ]
