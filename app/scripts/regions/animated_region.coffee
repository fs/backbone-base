class AnimatedRegion extends Marionette.Region
  initialize: (options) ->
    @animation = options.animation

  attachHtml: (view) ->
    @$el
      .hide(0)
      .html(view.el)
      .velocity('stop')

    for animation in @animation.showAnimation
      @$el.velocity(animation.p, animation.o)

  empty: ->
    view = @currentView
    return unless view
    @$el.velocity('stop')

    if @animation.hideAnimation
      itter = 0
      length = @animation.hideAnimation.length

      for animation in @animation.hideAnimation
        $.Velocity.animate(
          @$el
          animation.p
          animation.o
        ).then =>
          itter++
          @_emptyRegion(view) if itter is length
    else
      @_emptyRegion(view)

  _emptyRegion: (view) ->
    view.off('destroy', @empty, @)
    @triggerMethod('before:empty', view)
    @_destroyView()
    @triggerMethod('empty', view)
    delete @currentView
    @

module.exports = AnimatedRegion
