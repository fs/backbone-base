Session = require('../../facades/session')
FormBehavior = require('../../views/behaviors/form')
template = require('../../../templates/navigation/login')

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
      Session.create()

module.exports = NavigationLoginView
