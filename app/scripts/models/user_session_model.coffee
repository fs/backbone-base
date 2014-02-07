define [
  'backbone'
  'models/user_model'
], (Backbone, UserModel) ->

  class UserSessionModel
    instance = null

    @getInstance: ->
      instance or= new PrivateClass()

    class PrivateClass extends UserModel
      url: 'api/sign_in.json'

      initialize: ->
        @storage = localStorage

        unless @storageIsEmpty()
          attributes = JSON.parse(@storage.getItem('userSession'))
          @set(attributes)

      saveInStorage: (data) ->
        @storage.setItem('userSession', data)

      storageIsEmpty: ->
        @storage.getItem('userSession') is null

      isLogged: ->
        not @storageIsEmpty()

      logout: ->
        @storage.removeItem('userSession')
        @clear()

      login: ->
        $.Deferred((def) =>
          if @storageIsEmpty()
            @save {},
              success: =>
                @saveInStorage(JSON.stringify(@attributes))
                def.resolve()
              error: ->
                def.reject()
        ).promise()
