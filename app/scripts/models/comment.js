import SessionModel from 'scripts/models/session';
import { props } from 'scripts/decorators';

@props({
  urlRoot: 'comments',

  validation: {
    text: {
      required: true
    }
  }
})
export default class Comment extends SessionModel {}
