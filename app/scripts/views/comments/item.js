import Marionette from 'backbone.marionette';
import user from 'scripts/helpers/user';
import template from 'templates/comments/item';
import { props } from 'scripts/decorators';

@props({
  className: 'media',
  template: template,

  templateHelpers: {
    user: user
  }
})
export default class CommentsItemView extends Marionette.ItemView {}
