module.exports = (grunt) ->
  options:
    bare: true
  development:
    files: [
      expand: true
      cwd: '<%= grunt.appDir %>/scripts'
      src: ['*.coffee', '**/*.coffee']
      dest: '<%= grunt.publicDir %>/scripts'
      ext: '.js'
    ]
  tests:
    files: [
      expand: true
      cwd: '<%= grunt.testDir %>/coffee'
      src: ['*.coffee', '**/*.coffee']
      dest: '<%= grunt.testDir %>/scripts'
      ext: '.js'
    ]
