define [
  'marionette'
  'templates'
], (Marionette) ->

  class HeaderLoginView extends Marionette.ItemView
    className: 'nav navbar-nav navbar-right'
    template: JST['templates/header/login']

    events:
      'submit #login_form': 'onFormSubmit'

    ui:
      form: '#login_form'

    onFormSubmit: (event) ->
      event.preventDefault()
      @model.login(@_getFormData(@ui.form)).done ->
        console.log 'user has logged'

    _getFormData: (form) ->
      @model.set
        user_email: form.find('#user_email').val()
        user_password: form.find('#user_password').val()
