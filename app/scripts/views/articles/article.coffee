define [
  'marionette'
], (Marionette) ->

  class ArticleView extends Marionette.ItemView
    className: 'media'
    template: JST['templates/articles/article']

    events:
      'click .close': 'onRemoveClicked'

    onRemoveClicked: ->
      @model.destroy().then =>
        alert 'article deleted'
