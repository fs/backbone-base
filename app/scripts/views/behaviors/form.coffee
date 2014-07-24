define [
  'marionette'
  'backbone.stickit'
  'backbone-validation'
], (Marionette) ->

  class FormBehavior extends Marionette.Behavior
    defaults:
      forceUpdate: true
      tooltip:
        placement: 'bottom'
        trigger: 'focus'

    bindValidation: ->
      Backbone.Validation.bind @view,
        forceUpdate: @options.forceUpdate
        valid: @onValid
        invalid: @onInvalid

    unbindValidation: ->
      Backbone.Validation.unbind @view

    onRender: ->
      @bindValidation()
      @view.stickit()

    onClose: ->
      @unbindValidation()

    onValid: (view, attr) ->
      $el = view.$("[name='#{attr}']")
      $group = $el.closest('.form-group')

      $group.removeClass('has-error').tooltip('destroy')

    onInvalid: (view, attr, error) =>
      $el = view.$("[name='#{attr}']")
      $group = $el.closest('.form-group')

      $group.addClass('has-error').tooltip
        title: error
        placement: @options.tooltip.placement
        trigger: @options.tooltip.trigger
