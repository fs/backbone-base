App = new Marionette.Application
Session = require('scripts/facades/session')
FormBehavior = require('scripts/views/behaviors/form')
template = require('templates/navigation/login')

class NavigationLoginView extends Marionette.ItemView
  className: 'nav navbar-nav navbar-right'
  template: template
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
      Session.create().then ->
        App.vent.trigger('notification:show', {type: 'success', message: 'You have successfully logged!'})

module.exports = NavigationLoginView
