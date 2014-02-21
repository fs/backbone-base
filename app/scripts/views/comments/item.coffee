define [
  'marionette'
  'templates'
], (Marionette) ->

  class CommentsItemView extends Marionette.ItemView
    className: 'media'
    template: JST['templates/comments/item']
