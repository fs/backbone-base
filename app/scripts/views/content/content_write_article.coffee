define [
  'marionette'
  'models/user_session'
], (Marionette, UserSession) ->

  class WriteArticleView extends Marionette.ItemView
    template: JST['templates/content/content_write_article']
    model: UserSession.getInstance()

    events:
      'submit form#save_article': '_onSaveArticle'

    _onSaveArticle: (event) ->
      event.preventDefault()
      $form = $(event.currentTarget)
      data =
        'text': $form.find('textarea').val()
        'user_name': @model.get('user_name')
        'avatar': @model.get('user_avatar')
      @collection.saveArticle(data)

