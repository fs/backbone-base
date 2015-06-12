import AppCollection from 'scripts/collections/app';
import Comment from 'scripts/models/comment';

export default class Comments extends AppCollection {
  constructor(...args) {
    this.model = Comment;

    super(...args);
  }
}
