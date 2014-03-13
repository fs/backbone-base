module.exports = (grunt) ->
  options:
    linenos: true
    compress: false
    urlfunc: 'embedurl'
    paths: ['bower_components', 'vendor']
  development:
    files:
      '<%= grunt.publicDir %>/stylesheets/style.css': '<%= grunt.appDir %>/stylesheets/application.styl'
  watch:
    files: {}
