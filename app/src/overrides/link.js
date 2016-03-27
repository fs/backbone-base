import $ from 'jquery';
import History from 'services/history';

export default class LinkOverride {
  static init() {
    this.followLink();
  }

  static followLink() {
    $(document).on('click', "a[href^='/']", (event) => {
      event.preventDefault();
      const href = $(event.currentTarget).attr('href');
      History.navigate(href, { trigger: true });
    });
  }
}
