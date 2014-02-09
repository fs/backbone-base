define [
  'marionette'
  'views/content/content_comment'
  'collections/comments'
], (Marionette, CommentView, CommentsCollection) ->

  class ArticleView extends Marionette.CompositeView
    className: 'media'
    template: JST['templates/content/content_article']
    itemView: CommentView
    itemViewContainer: '.comments'

    initialize: ->
      @collection = new CommentsCollection
      @collection.fetch()
