module.exports = (grunt) ->
  development: [
    'jade:jst'
    'stylus:development'
    'coffee:development'
    'coffeelint:development'
  ]
