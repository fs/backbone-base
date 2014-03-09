module.exports = (grunt) ->
  options:
    livereload: true
    spawn: false
  development:
    files: ['<%= grunt.appDir %>/**/*']
    tasks: [
      'templates'
      'stylus:development'
      'coffee:watch'
      'coffeelint:watch'
    ]
  production:
    files: []
