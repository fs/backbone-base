import template from 'templates/comments/item';

export default class CommentsItemView extends Marionette.ItemView {
  constructor(...args) {
    this.className = 'media';
    this.template = template;

    super(...args);
  }
}
