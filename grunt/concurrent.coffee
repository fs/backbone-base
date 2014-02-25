module.exports = (grunt) ->
  development: [
    'templates'
    'stylus:development'
    'coffee:development'
    'coffeelint'
  ]
