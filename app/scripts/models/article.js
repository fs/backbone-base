import SessionModel from 'scripts/models/session';
import Comments from 'scripts/collections/comments';
import { props } from 'scripts/decorators';

@props({
  urlRoot: 'articles',

  defaults: {
    comments_count: 0
  },

  validation: {
    text: {
      required: true
    },
    title: {
      required: true
    }
  }
})
export default class Article extends SessionModel {
  parse(response) {
    if (response.comments) {
      this.set('comments', new Comments(response.comments));
      delete response.comments;
    }

    return super.parse(response);
  }
}
