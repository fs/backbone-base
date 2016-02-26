import $ from 'jquery';
import Backbone from 'backbone';

export default class LinkOverride {
  static init() {
    this.followLink();
  }

  static followLink() {
    $(document).on('click', "a[href^='/']", (event) => {
      event.preventDefault();
      const href = $(event.currentTarget).attr('href');
      Backbone.history.navigate(href, { trigger: true });
    });
  }
}
