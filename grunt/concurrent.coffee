module.exports = (grunt) ->
  compile: [
    'templates'
    'stylus:development'
    'coffee:development'
    'coffeelint'
  ]
