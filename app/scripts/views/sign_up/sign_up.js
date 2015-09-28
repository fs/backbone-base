import template from 'templates/sign_up/sign_up';

export default class SignUpView extends Marionette.ItemView {
  constructor(...args) {
    this.template = template;

    super(...args);
  }
}
