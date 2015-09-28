import App from 'scripts/application';
import AppModel from 'scripts/models/app';

export default class Comment extends AppModel {
  constructor(...args) {
    this.defaults = {
      'avatar': `${App.origin}/images/avatar.png`
    };

    super(...args);
  }
}
