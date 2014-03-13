define ['application', 'routers/articles'], (App, ArticlesRouter) ->

  Articles = App.module('Articles')

  Articles.addInitializer ->
    @router = new ArticlesRouter

  Articles.on 'start', ->
    console.log 'module articles started'

  Articles
