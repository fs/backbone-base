define [
  'marionette'
], (Marionette) ->

  class HeaderLoginView extends Marionette.ItemView
    className: 'nav navbar-nav navbar-right'
    templateForm: JST['templates/header/header_login_form']

    events:
      "submit #login_form": "onFormSubmit"

    onFormSubmit: (event) ->
      #TODO: replace this view with two single views and do dashboard redirect
      event.preventDefault()
      @model.login(@_getFormData(@$form)).then =>
        @$el.html(@templateGreeting(@model.attributes))

    # render: ->
    #   if @model.isLogged() then @$el.html(@templateGreeting(@model.attributes))
    #   else @$el.html(@templateForm)
    #   @$form = @$('#login_form')

    _getFormData: (form) ->
      @model.set
        user_email: form.find('#user_email').val()
        user_password: form.find('#user_password').val()
