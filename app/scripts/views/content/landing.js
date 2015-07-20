import template from 'templates/content/landing';

export default class ContentLandingView extends Marionette.ItemView {
  constructor(...args) {
    this.className = 'page-header';
    this.template = template;

    super(...args);
  }
}
