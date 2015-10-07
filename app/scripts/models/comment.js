import App from 'scripts/application';
import AppModel from 'scripts/models/app';

export default class Comment extends AppModel {
  constructor(...args) {
    this.urlRoot = 'comments';

    this.validation = {
      text: {
        required: true
      }
    };

    super(...args);
  }
}
