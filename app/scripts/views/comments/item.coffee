template = require('../../../templates/comments/item.jade')

class CommentsItemView extends Marionette.ItemView
  className: 'media'
  template: template

module.exports = CommentsItemView
