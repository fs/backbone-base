import CommentsItemView from 'scripts/views/comments/item';
import user from 'scripts/helpers/user';
import template from 'templates/articles/show';
import { props } from 'scripts/decorators';

@props({
  className: 'media',
  template: template,
  childView: CommentsItemView,
  childViewContainer: '.comments',

  templateHelpers: {
    user: user
  }
})
export default class ArticlesShowView extends Marionette.CompositeView {
  initialize() {
    this.collection = this.model.get('comments');
  }
}
