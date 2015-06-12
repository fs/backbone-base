import AppModel from 'scripts/models/app';

export default class Comment extends AppModel {
  constructor(...args) {
    this.defaults = {
      'articleId': '',
      'user': 'User',
      'comment': 'Comment',
      'avatar': 'http://localhost:8000/images/avatar.png' // TO DO: url root should be replaced by the url root form configuration class
    };

    super(...args);
  }
}
