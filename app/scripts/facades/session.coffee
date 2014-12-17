AppConfig = require('scripts/config')
User = require('scripts/models/user')
Storage = require('scripts/facades/storage')

class Session
  _.extend @, Backbone.Events

  STORAGE_KEY = AppConfig.storageKey
  SESSION_KEY = AppConfig.sessionKey

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
