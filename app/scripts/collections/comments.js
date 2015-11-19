import Comment from 'scripts/models/comment';
import AppCollection from 'scripts/collections/app';
import { props } from 'scripts/decorators';

@props({
  model: Comment
})
export default class Comments extends AppCollection {}
