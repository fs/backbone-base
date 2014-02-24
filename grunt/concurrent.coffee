module.exports = (grunt) ->
  development: [
    'templates'
    'stylus:development'
    'coffee:development'
    'coffeelint'
  ]
  production: [
    'stylus:production'
    'coffee:production'
    'coffeelint'
  ]
