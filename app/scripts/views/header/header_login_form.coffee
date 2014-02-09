define [
  'marionette'
  'models/user_session'
], (Marionette, UserSession) ->

  class HeaderLoginFormView extends Marionette.ItemView
    tagName: 'div'
    className: 'nav navbar-nav navbar-right'
    templateForm: JST['templates/header/header_login_form']
    templateGreeting: JST['templates/header/header_user_greeting']
    model: UserSession.getInstance()

    events:
      "submit #login_form": "onFormSubmit"
      "click #logout button": "onExit"

    onFormSubmit: (event) ->
      event.preventDefault()
      @model.login(@_getFormData(@$form)).then =>
        @$el.html(@templateGreeting(@model.attributes))

    onExit: (event) ->
      @model.logout()
      @$el.html(@templateForm)

    render: ->
      if @model.isLogged() then @$el.html(@templateGreeting(@model.attributes))
      else @$el.html(@templateForm)
      @$form = @$('#login_form')

    _getFormData: (form) ->
      @model.set
        user_email: form.find('#user_email').val()
        user_password: form.find('#user_password').val()
