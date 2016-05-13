import { mixin } from 'core-decorators';
import Comment from 'models/comment';
import AppCollection from 'collections/app';

@mixin({
  model: Comment
})
export default class Comments extends AppCollection {}
