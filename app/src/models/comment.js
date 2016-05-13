import { mixin } from 'core-decorators';
import SessionModel from 'models/session';

@mixin({
  urlRoot: 'comments',

  validation: {
    text: {
      required: true
    }
  }
})
export default class Comment extends SessionModel {}
