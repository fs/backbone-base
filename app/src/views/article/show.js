import Marionette from 'backbone.marionette';
import CommentsItemView from 'views/comments/item';
import user from 'helpers/user';
import template from 'templates/article/show';
import { props } from 'decorators';

@props({
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
