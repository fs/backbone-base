module.exports = (grunt) ->
  development: [
    'jade:html'
    'jade:jst'
    'targethtml:development'
    'stylus:development'
    'coffee:development'
    'coffeelint:development'
  ]
