import CommentsItemView from 'scripts/views/comments/item';
import template from 'templates/articles/show';

export default class ArticlesShowView extends Marionette.CompositeView {
  constructor(...args) {
    this.className = 'media';
    this.template = template;
    this.childView = CommentsItemView;
    this.childViewContainer = '.comments';

    super(...args);

    this.collection = this.model.get('comments');
  }
}
