import AppModel from 'scripts/models/app';
import Comments from 'scripts/collections/comments';

export default class Article extends AppModel {
  constructor(...args) {
    this.urlRoot = 'articles';

    this.defaults = {
      comments_count: 0
    };

    this.validation = {
      text: {
        required: true
      },
      title: {
        required: true
      }
    };

    super(...args);
  }

  parse(response) {
    if (response.comments) {
      this.set('comments', new Comments(response.comments));
      delete response.comments;
    }

    return super.parse(response);
  }
}
