import user from 'scripts/helpers/user';
import template from 'templates/comments/item';

export default class CommentsItemView extends Marionette.ItemView {
  constructor(...args) {
    this.className = 'media';
    this.template = template;

    this.templateHelpers = {
      user: user
    };

    super(...args);
  }
}
