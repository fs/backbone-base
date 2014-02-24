module.exports = (grunt) ->
  options:
    livereload: true
    spawn: false
  files: ['<%= grunt.appDir %>/**/*']
  tasks: [
    'templates'
    'stylus:development'
    'coffee:development'
    'coffeelint'
  ]
