require [
  'config'
  'application'
  'modules/header'
  'modules/dashboard'
  'modules/articles'
], (_, App) ->
  App.start()
