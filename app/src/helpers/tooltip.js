export default class Tooltip {
  static add($selector, options) {
    if ($selector.length) {
      const $formGroup = $selector.closest('.form-group');

      $formGroup.addClass('has-error').tooltip({
        title: options.title,
        placement: options.placement,
        trigger: options.trigger
      });
    }
  }

  static destroy($selector) {
    if ($selector.length) {
      const $formGroup = $selector.closest('.form-group');

      $formGroup.removeClass('has-error').tooltip('destroy');
    }
  }
}
