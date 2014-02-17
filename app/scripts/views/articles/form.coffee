define [
  'marionette'
  'models/user_session'
], (Marionette, UserSession) ->

  class ArticlesFormView extends Marionette.ItemView
    template: JST['templates/articles/form']
    model: UserSession.getInstance()

    ui:
      form: '#save_article'

    events:
      'submit form#save_article': 'onSaveArticle'

    onSaveArticle: (event) ->
      event.preventDefault()
      data =
        'text': @ui.form.find('textarea').val()
        'user_name': @model.get('user_name')
        'avatar': @model.get('user_avatar')
      @collection.create(data)

