Session = require('scripts/facades/session')
routes = require('scripts/helpers/routes')
template = require('templates/articles/item')

class ArticlesItemView extends Marionette.ItemView
  className: 'media'
  template: template

  events:
    'click .close': 'onRemoveClicked'

  templateHelpers:
    routes: routes

  serializeData: ->
    _.extend super, Session.currentUser().pick('avatar', 'name')

  onRemoveClicked: ->
    @model.destroy
      success: ->
        alert 'article deleted'

module.exports = ArticlesItemView
