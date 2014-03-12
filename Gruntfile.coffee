module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
  grunt.appDir = 'app'
  grunt.publicDir = 'public'
  grunt.productionDir = 'production'
  grunt.testDir = 'specs'
  grunt.ports =
    livereload: 35729
    connect: 8000
    easymock: 8001

  require('load-grunt-config')(grunt)
