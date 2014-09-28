module.exports = (grunt) ->
  development:
    options:
      patterns: [
        match: 'environment'
        replacement: 'development'
      ]
    files: [
      expand: true
      flatten: true
      src: ['<%= grunt.publicDir %>/scripts/configs/config.js']
      dest: '<%= grunt.publicDir %>/scripts/configs/'
    ]
  production:
    options:
      patterns: [
        match: 'environment'
        replacement: 'production'
      ]
    files: [
      expand: true
      flatten: true
      src: ['<%= grunt.publicDir %>/scripts/configs/config.js']
      dest: '<%= grunt.publicDir %>/scripts/configs/'
    ]
