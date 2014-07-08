require [
  'config'
  'application'
  'modules/navigation'
  'modules/landing'
  'modules/dashboard'
  'modules/articles'
  'modules/notifications'
], (_, App) ->

  App.start()
