App = require('scripts/application')
ArticlesLayout = require('scripts/views/layouts/articles_layout')
ArticlesShowView = require('scripts/views/articles/show')
Article = require('scripts/models/article')
Articles = require('scripts/collections/articles')

class ArticlesController extends Marionette.Controller
  index: ->
    articles = new Articles

    articles.fetch().then ->
      App.mainRegion.show(new ArticlesLayout(collection: articles))

  show: (id) ->
    model = new Article(id: id)

    model.fetch().then ->
      App.mainRegion.show(new ArticlesShowView(model: model))

module.exports = ArticlesController
