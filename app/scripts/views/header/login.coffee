define [
  'marionette'
  'facades/session'
  'helpers/routes'
  'views/abstract/form_view'
  'templates'
], (Marionette, Session, Routes, AbstractFormView) ->

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
        Session.create().done =>
          @redirect Routes.dashboardPath()
          console.log 'user has logged'

    # TODO: Move this code to helper/mixin
    redirect: (path) ->
      Backbone.history.navigate(path, trigger: true)
