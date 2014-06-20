define [
  'marionette'
], (Marionette) ->

  class AbstractFormView extends Marionette.ItemView
    initialize: ->
      @bindValidation()

    onRender: ->
      @stickit()

    onDestroy: ->
      @unbindValidation()

    bindValidation: ->
      Backbone.Validation.bind @,
        forceUpdate: true
        valid: @onValid
        invalid: @onInvalid

    unbindValidation: ->
      Backbone.Validation.unbind @

    onValid: (view, attr) ->
      $el = view.$("[name='#{attr}']")
      $group = $el.closest('.form-group')

      $group.removeClass('has-error').tooltip('destroy')

    onInvalid: (view, attr, error) ->
      $el = view.$("[name='#{attr}']")
      $group = $el.closest('.form-group')

      $group.addClass('has-error').tooltip
        title: error
        placement: 'bottom'
        trigger: 'focus'
