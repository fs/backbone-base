import Marionette from 'backbone.marionette';
import ArticlesShowView from 'scripts/views/articles/show';
import CommentFormView from 'scripts/views/comments/form';
import template from 'templates/layouts/article_layout';
import { props } from 'scripts/decorators';

@props({
  template,

  regions: {
    articleRegion: '#article_region',
    writeCommentRegion: '#write_comment_region'
  }
})
export default class ArticleLayout extends Marionette.LayoutView {
  initialize() {
    this.listenTo(this.model.get('comments'), 'add', this.onAddNewComment);
  }

  onRender() {
    this.articleRegion.show(new ArticlesShowView({ model: this.model }));
    this.writeCommentRegion.show(new CommentFormView({ currentArticle: this.model }));
  }

  onAddNewComment() {
    this.writeCommentRegion.show(new CommentFormView({ currentArticle: this.model }));
  }
}
