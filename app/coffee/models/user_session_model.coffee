define [
  'Marionette'
], (Marionette) ->

  class UserSessionModel
    instance = null

    class PrivateClass extends Backbone.Model
      url: "mocks/sign_in.json"
      saveToken: (token) ->
        localStorage.setItem('sessionToken', token)
      getToken: ->
        localStorage.getItem('sessionToken')
      removeToken: ->
        localStorage.removeItem('sessionToken')
      login: ->
        unless @getToken()?
          @fetch
            success: =>
              @saveToken(@get('sessionToken'))

    @getInstance: ->
      instance or= new PrivateClass()
