import Marionette from 'backbone.marionette';
import { mixin } from 'core-decorators';
import user from 'helpers/user';
import CommentsItemView from 'views/comments/item';
import template from 'templates/article/show';

@mixin({
  template,
  className: 'article',
  childView: CommentsItemView,
  childViewContainer: '.comments',

  templateHelpers: { user }
})
export default class ArticlesShowView extends Marionette.CompositeView {
  initialize() {
    this.collection = this.model.get('comments');
  }
}
