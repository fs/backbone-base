define [
  'collections/app'
  'models/comment'
], (AppCollection, CommentModel) ->

  class CommentsCollection extends AppCollection
    url: 'api/comments.json'
    model: CommentModel
