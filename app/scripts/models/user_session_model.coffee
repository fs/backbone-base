define [
  'backbone'
  'models/user_model'
  'storage'
], (Backbone, UserModel, Storage) ->

  class UserSessionModel
    instance = null

    @getInstance: ->
      instance or= new PrivateClass()

    class PrivateClass extends UserModel
      url: 'api/sign_in'

      initialize: ->
        unless @storageIsEmpty()
          attributes = JSON.parse(Storage.getItem('userSession'))
          @set(attributes)

      saveInStorage: (data) ->
        Storage.setItem('userSession', data)

      storageIsEmpty: ->
        Storage.getItem('userSession') is null

      isLogged: ->
        not @storageIsEmpty()

      logout: ->
        Storage.removeItem('userSession')
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
