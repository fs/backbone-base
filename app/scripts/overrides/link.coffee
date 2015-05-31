class LinkOverride
  @init: ->
    followLink()

  followLink = ->
    $(document).on 'click', "a[href^='/']", (event) ->
      event.preventDefault()
      href = $(event.currentTarget).attr('href')
      Backbone.history.navigate(href, trigger: true)

module.exports = LinkOverride
