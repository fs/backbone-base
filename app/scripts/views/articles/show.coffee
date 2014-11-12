CommentsItemView = require('../../views/comments/item')
template = require('../../../templates/articles/show')

class ArticlesShowView extends Marionette.CompositeView
  className: 'media'
  template: template
  childView: CommentsItemView
  childViewContainer: '.comments'

  initialize: ->
    @collection = @model.get('comments')

module.exports = ArticlesShowView
