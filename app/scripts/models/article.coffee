define ['backbone'], (Backbone) ->

  class ArticleModel extends Backbone.Model
    url: 'api/article.json'
