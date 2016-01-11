import _ from 'underscore';
import Marionette from 'backbone.marionette';
import App from 'scripts/application';
import Routes from 'scripts/helpers/routes';
import template from 'templates/navigation/navigation';
import { props } from 'scripts/decorators';

@props({
  tagName: 'ul',
  className: 'nav navbar-nav',
  template: template,

  ui: {
    menuItem: 'li'
  },

  templateHelpers: {
    routes: Routes
  }
})
export default class NavigationView extends Marionette.ItemView {
  initialize() {
    this.listenTo(App.vent, 'navigation:change', this.onHighlightNavigation);
  }

  serializeData() {
    return { defaultPage: 1 };
  }

  onHighlightNavigation(nav) {
    this.ui.menuItem.removeClass('active');

    if (!_.isEmpty(nav)) {
      this.$el.find(`a[data-nav=${nav}]`).parent().addClass('active');
    }
  }
}
