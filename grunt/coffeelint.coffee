module.exports = (grunt) ->
  options:
    'no_trailing_whitespace':
      level: 'warn'
    'camel_case_classes':
      level: 'warn'
    'arrow_spacing':
      level: 'warn'
    'newlines_after_classes':
      level: 'ignore'
    'max_line_length':
      level: 'ignore'
  development:
    files:
      src: ['<%= grunt.appDir %>/scripts/**/*.coffee', '<%= grunt.testDir %>/coffee/**/*.coffee']
  watch:
    files: {}
