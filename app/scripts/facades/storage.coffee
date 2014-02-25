define ->

  class Storage
    storage = localStorage

    @set: (key, data) ->
      data = JSON.stringify(data)
      storage.setItem(key, data)

    @get: (key) ->
      data = storage.getItem(key)
      JSON.parse(data)

    @remove: (key) ->
      storage.removeItem(key)

    @clear: ->
      storage.clear()
