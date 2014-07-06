define [
  'marionette'
  'facades/session'
  'views/behaviors/form'
  'templates'
], (Marionette, Session, FormBehavior) ->

  class HeaderLoginView extends Marionette.ItemView
    className: 'nav navbar-nav navbar-right'
    template: JST['templates/navigation/login']

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

    model: Session.currentUser()

    onFormSubmit: (event) ->
      event.preventDefault()

      if @model.isValid(true)
        Session.create()
