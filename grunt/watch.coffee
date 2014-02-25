module.exports = (grunt) ->
  options:
    livereload: true
    spawn: false
  development:
    files: ['<%= grunt.appDir %>/**/*']
    tasks: [
      'templates'
      'stylus:development'
      'coffee:development'
      'coffeelint'
    ]
  production:
    files: []
