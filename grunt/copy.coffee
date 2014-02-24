module.exports = (grunt) ->
  # production:
  #   files: [
  #     expand: true
  #     cwd: '<%= grunt.publicDir %>'
  #     src: ['**']
  #     dest: '<%= grunt.productionDir %>'
  #   ,
  #     src: '<%= grunt.publicDir %>/stylesheets/style.css'
  #     dest: '<%= grunt.productionDir %>/style.css'
  #   ]
  production:
    files: [
      expand: true
      cwd: 'bower_components'
      src: ['**']
      dest: '<%= grunt.productionDir %>/bower_components'
    ,
      expand: true
      cwd: 'vendor'
      src: ['**']
      dest: '<%= grunt.productionDir %>/vendor'
    ]
