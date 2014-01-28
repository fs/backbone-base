define [
  'Marionette'
  'Models/user_session_model'
], (Marionette, UserSession) ->

  class HeaderLoginFormView extends Backbone.Marionette.ItemView
    tagName: 'div'
    className: 'nav navbar-nav navbar-right'
    templateForm: JST["app/templates/header/header_login_form_template.html"]
    templateGreeting: JST["app/templates/header/header_user_greeting_template.html"]
    model: UserSession.getInstance()

    events:
      "submit #login_form": "onFormSubmit"
      "click #logout button": "onExit"
    
    modelEvents:
      'change': 'render'

    onFormSubmit: (event) ->
      event.preventDefault()
      @model.login(@_getFormData(@$form))

    onExit: (event) ->
      @model.logout()

    render: ->
      console.log  @model.isLogged()
      if @model.isLogged() then @$el.html(@templateGreeting)
      else @$el.html(@templateForm)
      @$form = @$('#login_form')

    _getFormData: (form) ->
      obj =
        user: form.find('#user_email').val()
        pass: form.find('#user_password').val()
