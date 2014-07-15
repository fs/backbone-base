require ['config'], ->
  require [
    'application'
    'modules/navigation'
    'modules/landing'
    'modules/dashboard'
    'modules/articles'
  ], (App) ->

    App.start()
