import 'babel-polyfill';
import Marionette from 'backbone.marionette';
import App from 'scripts/application';
import Session from 'scripts/facades/session';
import routes from 'scripts/helpers/routes';
import user from 'scripts/helpers/user';
import template from 'templates/articles/item';
import { props } from 'scripts/decorators';

@props({
  className: 'media',
  template: template,

  events: {
    'click .close': 'articleRemove'
  },

  templateHelpers: {
    routes: routes,
    user: user
  }
})
export default class ArticlesItemView extends Marionette.ItemView {
  articleRemove() {
    this.model.destroy({ wait: true });
  }

  serializeData() {
    let props = { page: this.options.page };
    Object.assign(props, this.model.toJSON());

    return props;
  }
}
