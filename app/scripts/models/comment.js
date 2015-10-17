import SessionModel from 'scripts/models/session';

export default class Comment extends SessionModel {
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
