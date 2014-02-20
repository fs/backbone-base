define [
  'backbone'
  'models/user'
  'storage'
], (Backbone, User, Storage) ->

  class UserSession
    instance = null

    @getInstance: ->
      instance or= new PrivateClass()

    @isLogged: ->
      @getInstance().isLogged()

    @getToken: ->
      @getInstance().get('session_token')

    class PrivateClass extends User
      url: '/api/sign_in'

      initialize: ->
        unless @storageIsEmpty()
          attributes = JSON.parse(Storage.getItem('userSession'))
          @set(attributes)

      saveInStorage: (data) ->
        Storage.setItem('userSession', data)

      storageIsEmpty: ->
        Storage.getItem('userSession') is null

      isLogged: ->
        not _.isEmpty(@attributes.session_token)

      logout: ->
        Storage.removeItem('userSession')
        @clear()

      login: ->
        $.Deferred((def) =>
          if @storageIsEmpty()
            @save {},
              success: =>
                @saveInStorage(JSON.stringify(@attributes))
                console.log 'model save in storage'
                def.resolve()
              error: ->
                def.reject()
        ).promise()
