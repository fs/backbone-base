User = require('scripts/models/user')
Storage = require('scripts/facades/storage')

class Session
  _.extend @, Backbone.Events

  STORAGE_KEY = 'user_session'
  SESSION_KEY = 'session_token'

  currentUser = null

  @currentUser: ->
    currentUser or= new User(Storage.get(STORAGE_KEY))

  @create: ->
    deferred = $.Deferred()

    unless @isLoggedIn()
      @currentUser().save null,
        success: =>
          @save()
          @trigger 'create'
          deferred.resolve()
        error: ->
          deferred.reject()

    deferred.promise()

  @destroy: ->
    Storage.remove(STORAGE_KEY)
    @currentUser().clear()
    @trigger 'destroy'

  @save: ->
    Storage.set(STORAGE_KEY, @currentUser().toJSON())

  @isLoggedIn: ->
    not @currentUser().isNew()

  @getToken: ->
    @currentUser().pick(SESSION_KEY)

module.exports = Session
