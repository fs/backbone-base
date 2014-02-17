define [
  'marionette'
], (Marionette) ->

  class HeaderLoginView extends Marionette.ItemView
    className: 'nav navbar-nav navbar-right'
    template: JST['templates/header/header_login']

    events:
      'submit #login_form': 'onFormSubmit'

    ui:
      form: '#login_form'

    onFormSubmit: (event) ->
      event.preventDefault()
      @model.login(@_getFormData(@ui.form)).then =>
        @trigger('login')

    _getFormData: (form) ->
      @model.set
        user_email: form.find('#user_email').val()
        user_password: form.find('#user_password').val()
