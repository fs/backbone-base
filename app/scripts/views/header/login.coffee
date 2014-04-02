define [
  'marionette'
  'facades/session'
  'views/abstract/form_view'
  'templates'
], (Marionette, Session, AbstractFormView) ->

  class HeaderLoginView extends AbstractFormView
    className: 'nav navbar-nav navbar-right'
    template: JST['templates/header/login']

    events:
      'submit form': 'onFormSubmit'

    bindings:
      '[name="email"]':
        observe: 'email'
        updateView: false
        setOptions:
          validate: true
      '[name="password"]':
        observe: 'password'
        updateView: false
        setOptions:
          validate: true

    model: Session.currentUser()

    onFormSubmit: (event) ->
      event.preventDefault()

      if @model.isValid(true)
        Session.create()
