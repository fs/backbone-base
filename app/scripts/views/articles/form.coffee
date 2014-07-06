define [
  'marionette'
  'models/article'
  'views/behaviors/form'
  'facades/session'
  'templates'
], (Marionette, Article, FormBehavior, Session) ->

  class ArticlesFormView extends Marionette.ItemView
    template: JST['templates/articles/form']

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

    onRender: ->
      @model = new Article

    onFormSubmit: (event) ->
      event.preventDefault()

      if @model.isValid(true)
        $.when(@collection.create(@model)).then =>
          @render()
