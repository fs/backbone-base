define [
  'marionette'
  'views/content/content_comment'
], (Marionette, CommentView) ->

  class ArticleView extends Marionette.CompositeView
    className: 'media'
    template: JST['templates/content/content_article']
    itemView: CommentView
    itemViewContainer: '.comments'

    events:
      'click .close': 'onRemoveClicked'

    onRemoveClicked: ->
      @model.destroy().then =>
        alert 'article deleted'
