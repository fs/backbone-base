define [
  'marionette'
], (Marionette) ->

  class CommentView extends Marionette.ItemView
    className: 'media'
    template: JST['templates/article/comment']
