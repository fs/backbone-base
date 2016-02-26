import Comment from 'models/comment';
import AppCollection from 'collections/app';
import { props } from 'decorators';

@props({
  model: Comment
})
export default class Comments extends AppCollection {}
