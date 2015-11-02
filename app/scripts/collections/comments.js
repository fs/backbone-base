import AppCollection from 'scripts/collections/app';
import Comment from 'scripts/models/comment';
import { props } from 'scripts/decorators';

@props({
  model: Comment
})
export default class Comments extends AppCollection {}
