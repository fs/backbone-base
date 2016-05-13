import Marionette from 'backbone.marionette';
import { mixin } from 'core-decorators';
import Comment from 'models/comment';
import FormBehavior from 'behaviors/form';
import Session from 'services/session';
import user from 'helpers/user';
import template from 'templates/comments/form';

@mixin({
  template,

  events: {
    'submit form': 'onFormSubmit'
  },

  bindings: {
    '[name="text"]': {
      observe: 'text',
      updateView: false,
      setOptions: {
        validate: true
      }
    }
  },

  behaviors: {
    form: {
      behaviorClass: FormBehavior
    }
  },

  templateHelpers: { user }
})
export default class CommentFormView extends Marionette.ItemView {
  initialize() {
    this.currentArticle = this.options.currentArticle;
    this.model = new Comment(Session.currentUser().pick('avatar', 'name'));
    this.model.set('article_id', this.currentArticle.get('id'));
  }

  onFormSubmit(event) {
    event.preventDefault();

    if (this.model.isValid(true)) {
      this.currentArticle.get('comments').create(this.model, { wait: true });
    }
  }
}
