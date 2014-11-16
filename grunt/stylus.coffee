module.exports = (grunt) ->
  options:
    linenos: true
    compress: false
    urlfunc: 'embedurl'
    paths: [
      'bower_components'
      'vendor'
      'node_modules/grunt-contrib-stylus/node_modules'
      'node_modules/jeet/stylus'
    ]
    use: [
      () -> require('autoprefixer-stylus')('last 2 versions')
    ]
  development:
    files:
      '<%= grunt.publicDir %>/stylesheets/style.css': '<%= grunt.appDir %>/stylesheets/application.styl'
  watch:
    files: {}
