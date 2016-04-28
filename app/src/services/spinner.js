import _ from 'underscore';
import nprogress from 'nprogress';

nprogress.done = _.debounce(nprogress.done, 1000);

export default class Spinner {
  static init() {
    nprogress.configure({
      parent: '.spinner',
      showSpinner: false
    });
  }

  static hide() {
    nprogress.done();
  }

  static show() {
    nprogress.start();
  }
}
