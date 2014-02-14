define [
  'marionette'
  'views/article/comment'
], (Marionette, CommentView) ->

  class SingleArticle extends Marionette.CompositeView
    className: 'media'
    template: JST['templates/article/single_article']
    itemView: CommentView
    itemViewContainer: '.comments'

    render: ->
      super

      comments = @model.get('comments')
