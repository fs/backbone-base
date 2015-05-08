Article = require('scripts/models/article')
FormBehavior = require('scripts/views/behaviors/form')
Session = require('scripts/facades/session')
template = require('templates/articles/form')

class ArticlesFormView extends Marionette.ItemView
  template: template

  events:
    'submit form': 'onFormSubmit'

  bindings:
    '[name="text"]':
      observe: 'text'
      updateView: false
      setOptions:
        validate: true
    '[name="title"]':
      observe: 'title'
      updateView: false
      setOptions:
        validate: true

  behaviors:
    form:
      behaviorClass: FormBehavior
      tooltip:
        placement: 'left'
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
