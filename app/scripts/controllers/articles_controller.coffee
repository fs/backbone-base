App = require('../application.coffee')
ArticlesLayout = require('../views/layouts/articles_layout.coffee')
ArticlesShowView = require('../views/articles/show.coffee')
Article = require('../models/article.coffee')
Articles = require('../collections/articles.coffee')

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
