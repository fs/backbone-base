module.exports = (grunt) ->
  development:
    files: [
      { expand: true, cwd: '<%= grunt.appDir %>/images', dest: '<%= grunt.publicDir %>/images', src: '**' }
      { expand: true, cwd: '<%= grunt.appDir %>/fonts', dest: '<%= grunt.publicDir %>/fonts', src: '**' }
    ]
  production:
    files: [
      { expand: true, cwd: '<%= grunt.appDir %>/images', dest: '<%= grunt.productionDir %>/images', src: '**' }
      { expand: true, cwd: '<%= grunt.appDir %>/fonts', dest: '<%= grunt.productionDir %>/fonts', src: '**' }
    ]
