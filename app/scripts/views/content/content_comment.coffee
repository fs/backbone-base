define [
  'marionette'
], (Marionette) ->

  class CommentView extends Marionette.ItemView
    className: 'media'
    template: JST['templates/content/content_comment']
