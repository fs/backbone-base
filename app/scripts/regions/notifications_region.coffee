define [
  'marionette'
], (Marionette) ->

  class NotificationsRegion extends Marionette.Region
    ANIMATION_SPEED = 300

    el: '#notifications_list_region'

    attachHtml: (view) ->
      @$el.fadeOut(0)
      @$el.append(view.el)
      @$el.stop().fadeIn(ANIMATION_SPEED)

    onBeforeEmpty: ->
      @$el.fadeOut(ANIMATION_SPEED)
