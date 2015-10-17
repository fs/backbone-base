import Article from 'scripts/models/article';
import FormBehavior from 'scripts/views/behaviors/form';
import Session from 'scripts/facades/session';
import user from 'scripts/helpers/user';
import template from 'templates/articles/form';

export default class ArticlesFormView extends Marionette.ItemView {
  constructor(...args) {
    this.model = new Article(Session.currentUser().pick('avatar', 'name'));
    this.template = template;

    this.events = {
      'submit form': 'onFormSubmit'
    };

    this.bindings = {
      '[name="text"]': {
        observe: 'text',
        updateView: false,
        setOptions: {
          validate: true
        }
      },
      '[name="title"]': {
        observe: 'title',
        updateView: false,
        setOptions: {
          validate: true
        }
      }
    };

    this.behaviors = {
      form: {
        behaviorClass: FormBehavior
      }
    };

    this.templateHelpers = {
      user: user
    };

    super(...args);
  }

  onFormSubmit(event) {
    event.preventDefault();

    if (this.model.isValid(true)) {
      this.collection.create(this.model, { wait: true });
    }
  }
}
