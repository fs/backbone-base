class AnimatedRegion extends Marionette.Region
  initialize: (options) ->
    @animation = options.animation

  attachHtml: (view) ->
    @$el
      .css(display: 'none')
      .html(view.el)
      .velocity('stop')

    if @animation and @animation.showAnimation
      this._iterateOverAnimations @animation.showAnimation, ->
        AnimatedRegion.trigger('region:showed', @)
    else
      @$el.css(display: 'block')

  empty: ->
    view = @currentView
    return unless view
    @$el.velocity('stop')

    if @animation and @animation.hideAnimation
      @_iterateOverAnimations @animation.hideAnimation, ->
        @_emptyRegion(view)
        @$el.removeAttr('style')
        AnimatedRegion.trigger('region:removed', @)
    else
      @_emptyRegion(view)

  _iterateOverAnimations: (animations, callback) ->
    iterator = 0
    length = animations.length

    for animation in animations
      $.Velocity.animate(@$el, animation.p, animation.o).then =>
        iterator++
        callback.call(@) if iterator is length

  _emptyRegion: (view) ->
    view.off('destroy', @empty, @)
    @triggerMethod('before:empty', view)
    @_destroyView()
    @triggerMethod('empty', view)
    delete @currentView
    @

_.extend(AnimatedRegion, Backbone.Events)

module.exports = AnimatedRegion
