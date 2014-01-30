define [
  'Marionette'
], (Marionette) ->

  class UserSessionModel
    instance = null

    class PrivateClass extends Backbone.Model
      url: 'api/sign_in.json'

      initialize: ->
        @storage = localStorage
      
      saveInStorage: (token) ->
        @storage.setItem('userSession', token)

      isLogged: ->
        console.log 'isLogged'
        $.when(@login).then =>
          if @storage.getItem('userSession')?
            # @set(JSON.parse(@storage.getItem('userSession')))
            console.log @attributes
            return true
          else
            return false
      
      logout: ->
        @storage.removeItem('userSession')
        @clear()
        @trigger 'change' 
      
      login: (data) ->
        if @storage.getItem('userSession') is null
          @fetch
            data: data
            success: =>
              console.log 'success'
              @saveInStorage(JSON.stringify(@attributes))
            error: ->
              console.log 'login error'
        else
          console.log 'deffered'
          deffered = new $.Deferred()
          deffered.promise()

    @getInstance: ->
      instance or= new PrivateClass()
