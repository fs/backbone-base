import Marionette from 'backbone.marionette';
import { mixin } from 'core-decorators';
import ArticleShowView from 'views/article/show';
import CommentFormView from 'views/comments/form';
import template from 'templates/article/layout';

@mixin({
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
    this.articleRegion.show(new ArticleShowView({ model: this.model }));
    this.writeCommentRegion.show(new CommentFormView({ currentArticle: this.model }));
  }

  onAddNewComment() {
    this.writeCommentRegion.show(new CommentFormView({ currentArticle: this.model }));
  }
}
