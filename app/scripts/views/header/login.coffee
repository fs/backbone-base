define [
  'marionette'
  'facades/session'
  'helpers/routes'
  'templates'
], (Marionette, Session, Routes) ->

  class HeaderLoginView extends Marionette.ItemView
    className: 'nav navbar-nav navbar-right'
    template: JST['templates/header/login']

    events:
      'submit #login_form': 'onFormSubmit'

    ui:
      form: '#login_form'

    templateHelpers:
      routes: Routes

    initialize: ->
      @model = Session.currentUser()

    onFormSubmit: (event) ->
      event.preventDefault()
      Session.create(@_getFormData(@ui.form)).done ->
        console.log 'user has logged'

    _getFormData: (form) ->
      data =
        email: form.find('#user_email').val()
        password: form.find('#user_password').val()
