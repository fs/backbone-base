import 'babel-polyfill';
import Marionette from 'backbone.marionette';
import App from 'application';
import Session from 'services/session';
import routes from 'helpers/routes';
import user from 'helpers/user';
import template from 'templates/articles/item';
import { props } from 'decorators';

@props({
  template,
  className: 'media',

  events: {
    'click .close': 'articleRemove'
  },

  templateHelpers: {
    routes,
    user
  }
})
export default class ArticlesItemView extends Marionette.ItemView {
  articleRemove() {
    this.model.destroy({ wait: true });
  }

  serializeData() {
    const props = { page: this.options.page };
    Object.assign(props, this.model.toJSON());

    return props;
  }
}
