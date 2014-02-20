define [
  'marionette'
], (Marionette) ->

  class ArticlesItemView extends Marionette.ItemView
    className: 'media'
    template: JST['templates/articles/item']

    events:
      'click .close': 'onRemoveClicked'

    onRemoveClicked: ->
      @model.destroy().then ->
        alert 'article deleted'
