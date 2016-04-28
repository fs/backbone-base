import Backbone from 'backbone';
import Spinner from 'services/spinner';

export default class SyncOverride {
  static init() {
    const oldBackboneSync = Backbone.sync;

    Spinner.init();

    Backbone.sync = function(method, model, options) {
      return new Promise((resolve, reject) => {
        Spinner.show();
        oldBackboneSync
          .apply(this, [method, model, options])
          .then((...params) => {
            Spinner.hide();
            resolve(...params);
          })
          .catch((...params) => {
            Spinner.hide();
            reject(...params);
          });
      });
    };
  }
}
