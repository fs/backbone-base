define [], () ->

  class Storage
    storage = localStorage

    setItem: (key, data) ->
      storage.setItem(key, data)

    getItem: (key) ->
      storage.getItem(key)

    removeItem: (key) ->
      storage.removeItem(key)

    clear: ->
      storage.clear()

  new Storage()
