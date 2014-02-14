define [
  'marionette'
  'models/user_session'
], (Marionette, UserSession) ->

  class WriteArticleView extends Marionette.ItemView
    template: JST['templates/articles/write_article']
    model: UserSession.getInstance()

    ui:
      form: '#save_article'

    events:
      'submit form#save_article': '_onSaveArticle'

    _onSaveArticle: (event) ->
      event.preventDefault()
      data =
        'text': @ui.form.find('textarea').val()
        'user_name': @model.get('user_name')
        'avatar': @model.get('user_avatar')
      @collection.create(data)

