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
      @$el.velocity(
        @animation.hideAnimation.p
        _.extend(@animation.hideAnimation.o, {complete: => @_emptyRegion(view)})
      )
    else
      @_emptyRegion(view)

  _emptyRegion: (view) ->
    view.off('destroy', @empty, @)
    @triggerMethod('before:empty', view)
    @_destroyView()
    @triggerMethod('empty', view)
    delete @currentView
    @

  _destroyView: ->
    view = @currentView
    return unless view

    if view.destroy and not view.isDestroyed
      view.destroy()
    else if view.remove
      view.remove()
      view.isDestroyed = true

module.exports = AnimatedRegion
