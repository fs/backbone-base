export default class LinkOverride {
  static init() {
    this.followLink();
  }

  static followLink() {
    $(document).on('click', "a[href^='/']", (event) => {
      event.preventDefault();
      let href = $(event.currentTarget).attr('href');
      Backbone.history.navigate(href, { trigger: true });
    });
  }
}
