Session = require('../../facades/session.coffee')
FormBehavior = require('../../views/behaviors/form.coffee')
template = require('../../../templates/navigation/login.jade')

class NavigationLoginView extends Marionette.ItemView
  className: 'nav navbar-nav navbar-right'
  template: template()

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

module.exports = NavigationLoginView
