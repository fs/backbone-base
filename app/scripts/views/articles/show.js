import Marionette from 'backbone.marionette';
import CommentsItemView from 'scripts/views/comments/item';
import user from 'scripts/helpers/user';
import template from 'templates/articles/show';
import { props } from 'scripts/decorators';

@props({
  template,
  className: 'media',
  childView: CommentsItemView,
  childViewContainer: '.comments',

  templateHelpers: { user }
})
export default class ArticlesShowView extends Marionette.CompositeView {
  initialize() {
    this.collection = this.model.get('comments');
  }
}
