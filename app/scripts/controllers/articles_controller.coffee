App = require('../application')
ArticlesLayout = require('../views/layouts/articles_layout')
ArticlesShowView = require('../views/articles/show')
Article = require('../models/article')
Articles = require('../collections/articles')

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
