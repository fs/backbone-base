import 'babel-polyfill';
import AppModel from 'scripts/models/app';
import Session from 'scripts/facades/session';

export default class SessionModel extends AppModel {
  sync(method, model, options) {
    if (Session.isLoggedIn()) {
      options.headers = options.headers || {};
      Object.assign(options.headers, {
        'X-User-Token': Session.token,
        'X-User-Email': Session.email
      });
    }

    return super.sync(method, model, options);
  }
}
