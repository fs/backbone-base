define [
  'backbone'
  'models/comment'
], (Backbone, CommentModel) ->

  class CommentsCollection extends Backbone.Collection
    url: 'api/comments.json'
    model: CommentModel
