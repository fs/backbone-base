define [
  'marionette'
  'application'
  'facades/session'
  'views/behaviors/form'
  'templates'
], (Marionette, App, Session, FormBehavior) ->

  class HeaderLoginView extends Marionette.ItemView
    template: JST['templates/header/login']

    className: 'nav navbar-nav navbar-right'

    model: Session.currentUser()

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

    behaviors:
      form:
        behaviorClass: FormBehavior
        tooltip:
          placement: 'bottom'
          trigger: 'focus'

    onFormSubmit: (event) ->
      event.preventDefault()

      if @model.isValid(true)
        Session.create()
        App.vent.trigger('notification', {type: 'success', message: 'You have successfully registered!'})
