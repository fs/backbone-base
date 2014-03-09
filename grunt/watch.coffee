module.exports = (grunt) ->
  options:
    livereload: true
    spawn: false
  development:
    files: ['<%= grunt.appDir %>/**/*']
    tasks: [
      'jade:html'
      'targethtml:development'
      'jade:watch'
      'stylus:watch'
      'coffee:watch'
      'coffeelint:watch'
    ]
  production:
    files: []
