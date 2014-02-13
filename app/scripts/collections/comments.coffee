define [
  'collections/app'
  'models/comment'
], (AppCollection, Comment) ->

  class Comments extends AppCollection
    model: Comment
