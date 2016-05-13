import Marionette from 'backbone.marionette';
import { mixin } from 'core-decorators';
import user from 'helpers/user';
import template from 'templates/comments/item';

@mixin({
  template,
  className: 'comments-item',
  templateHelpers: { user }
})
export default class CommentsItemView extends Marionette.ItemView {}
