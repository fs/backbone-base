import CommentsItemView from 'scripts/views/comments/item';
import user from 'scripts/helpers/user';
import template from 'templates/articles/show';

export default class ArticlesShowView extends Marionette.CompositeView {
  constructor(...args) {
    this.className = 'media';
    this.template = template;
    this.childView = CommentsItemView;
    this.childViewContainer = '.comments';

    this.templateHelpers = {
      user: user
    };

    super(...args);

    this.collection = this.model.get('comments');
  }
}
