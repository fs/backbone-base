define [
  'marionette'
  'views/comments/item'
  'templates'
], (Marionette, CommentsItemView) ->

  class ArticlesShowView extends Marionette.CompositeView
    className: 'media'
    template: JST['templates/articles/show']
    childView: CommentsItemView
    childViewContainer: '.comments'

    initialize: ->
      @collection = @model.get('comments')
