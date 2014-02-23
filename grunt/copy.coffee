module.exports = (grunt) ->
  production:
    files: [
      expand: true
      cwd: '<%= grunt.publicDir %>'
      src: ['**']
      dest: '<%= grunt.productionDir %>'
    ,
      src: '<%= grunt.publicDir %>/stylesheets/style.css'
      dest: '<%= grunt.productionDir %>/style.css'
    ]
