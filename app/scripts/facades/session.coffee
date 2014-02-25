define [
  'models/user'
  'facades/storage'
], (User, Storage) ->

  class Session
    STORAGE_KEY = 'user_session'
    SESSION_KEY = 'session_token'

    currentUser = null

    @currentUser: ->
      currentUser or= new User(Storage.get(STORAGE_KEY))

    @create: (data) ->
      deferred = $.Deferred()

      unless @isLoggedIn()
        @currentUser().save data,
          success: =>
            @save()
            deferred.resolve()
          error: ->
            deferred.reject()

      deferred.promise()

    @destroy: ->
      Storage.remove(STORAGE_KEY)
      @currentUser().clear()

    @save: ->
      Storage.set(STORAGE_KEY, @currentUser().toJSON())

    @isLoggedIn: ->
      not @currentUser().isNew()

    @getToken: ->
      @currentUser().pick(SESSION_KEY)
