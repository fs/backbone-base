Article = require('../../models/article.coffee')
FormBehavior = require('../../views/behaviors/form.coffee')
Session = require('../../facades/session.coffee')
template = require('../../../templates/articles/form.jade')

class ArticlesFormView extends Marionette.ItemView
  template: template()

  events:
    'submit form': 'onFormSubmit'

  bindings:
    '[name="text"]':
      observe: 'text'
      updateView: false
      setOptions:
        validate: true

  behaviors:
    form:
      behaviorClass: FormBehavior
      tooltip:
        placement: 'bottom'
        trigger: 'focus'

  serializeData: ->
    Session.currentUser().pick('avatar', 'name')

  initialize: ->
    @model = new Article

  onFormSubmit: (event) ->
    event.preventDefault()

    if @model.isValid(true)
      @collection.create(@model)

module.exports = ArticlesFormView
