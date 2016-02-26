import SessionModel from 'models/session';
import { props } from 'decorators';

@props({
  urlRoot: 'comments',

  validation: {
    text: {
      required: true
    }
  }
})
export default class Comment extends SessionModel {}
