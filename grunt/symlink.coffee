module.exports = (grunt) ->
  development:
    files: [
      expand: true
      overwrite: false
      cwd: ''
      src: ['bower_components', 'vendor']
      dest: '<%= grunt.publicDir %>'
      filter: 'isDirectory'
    ]
  production:
    files: [
      expand: true
      overwrite: false
      cwd: ''
      src: ['bower_components', 'vendor']
      dest: '<%= grunt.productionDir %>'
      filter: 'isDirectory'
    ]
