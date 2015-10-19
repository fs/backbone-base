export default class FormBehavior extends Marionette.Behavior {
  constructor(...args) {
    this.defaults = {
      forceUpdate: true,
      tooltip: {
        placement: 'bottom',
        trigger: 'hover focus'
      }
    };

    super(...args);
  }

  bindValidation() {
    Backbone.Validation.bind(this.view, {
      forceUpdate: this.options.forceUpdate,
      valid: this.onValid,
      invalid: (view, attr, error) => {
        this.onInvalid(view, attr, error);
      }
    });
  }

  bindValidationEvents() {
    this.listenTo(this.view.model, 'validation:invalid', (errors) => {
      let errorsKeys = _.keys(errors);

      _.each(errors, (error, attr) => {
        this.onInvalid(this.view, attr, error.join(','));
      });

      this.view.model.trigger('validated', false, this.view.model, errorsKeys);
      this.view.model.trigger('validated:invalid', this.view.model, errorsKeys);
    });
  }

  unbindValidation() {
    Backbone.Validation.unbind(this.view);
  }

  onRender() {
    this.bindValidation();
    this.bindValidationEvents();
    this.view.stickit();
  }

  onClose() {
    this.unbindValidation();
  }

  onValid(view, attr) {
    let $el = view.$(`[name=${attr}]`);
    let $group = $el.closest('.form-group');

    $group.removeClass('has-error').tooltip('destroy');
  }

  onInvalid(view, attr, error) {
    let $el = view.$(`[name=${attr}]`);
    let $group = $el.closest('.form-group');

    $group.addClass('has-error').tooltip({
      title: error,
      placement: this.options.tooltip.placement,
      trigger: this.options.tooltip.trigger
    });
  }
}
