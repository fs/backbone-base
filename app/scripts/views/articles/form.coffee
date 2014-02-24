define [
  'marionette'
  'facades/session'
  'templates'
], (Marionette, Session) ->

  class ArticlesFormView extends Marionette.ItemView
    template: JST['templates/articles/form']
    model: Session.currentUser()

    ui:
      form: '#save_article'

    events:
      'submit form#save_article': 'onSaveArticle'

    onSaveArticle: (event) ->
      event.preventDefault()
      data =
        'text': @ui.form.find('textarea').val()
        'name': @model.get('name')
        'avatar': @model.get('avatar')
      @collection.create(data)

