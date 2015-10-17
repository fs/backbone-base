import App from 'scripts/application';
import Session from 'scripts/facades/session';
import routes from 'scripts/helpers/routes';
import user from 'scripts/helpers/user';
import template from 'templates/articles/item';

export default class ArticlesItemView extends Marionette.ItemView {
  constructor(...args) {
    this.className = 'media';
    this.template = template;

    this.events = {
      'click .close': 'articleRemove'
    };

    this.templateHelpers = {
      routes: routes,
      user: user
    };

    super(...args);
  }

  articleRemove() {
    this.model.destroy();
  }
}
