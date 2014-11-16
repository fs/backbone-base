template = require('templates/comments/item')

class CommentsItemView extends Marionette.ItemView
  className: 'media'
  template: template

module.exports = CommentsItemView
