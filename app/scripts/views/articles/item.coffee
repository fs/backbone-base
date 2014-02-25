define [
  'marionette'
  'helpers/routes'
  'templates'
], (Marionette, Routes) ->

  class ArticlesItemView extends Marionette.ItemView
    className: 'media'
    template: JST['templates/articles/item']

    events:
      'click .close': 'onRemoveClicked'

    templateHelpers:
      routes: Routes

    onRemoveClicked: ->
      @model.destroy().then ->
        alert 'article deleted'
