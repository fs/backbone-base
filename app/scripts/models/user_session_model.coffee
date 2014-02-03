define [
  'Marionette'
  'Models/user_model'
], (Marionette, UserModel) ->

  class UserSessionModel
    instance = null

    class PrivateClass extends UserModel
      url: 'api/sign_in.json'

      initialize: ->
        @storage = localStorage
        unless @storageIsEmpty()
          @set(JSON.parse(@storage.getItem('userSession')))
      
      saveInStorage: (data) ->
        @storage.setItem('userSession', data)

      storageIsEmpty: ->
        @storage.getItem('userSession') is null

      isLogged: ->
        unless @storageIsEmpty() then true
        else false
      
      logout: ->
        @storage.removeItem('userSession')
        @clear()
      
      login: ->
        $.Deferred((def) =>
          if @storageIsEmpty()
            @fetch
              data: @attributes
              success: =>
                @saveInStorage(JSON.stringify(@attributes))
                def.resolve()
              error: ->
                def.reject()
        ).promise()

    @getInstance: ->
      instance or= new PrivateClass()
