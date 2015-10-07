import ArticlesShowView from 'scripts/views/articles/show';
import CommentFormView from 'scripts/views/comments/form';
import template from 'templates/layouts/article_layout';

export default class ArticleLayout extends Marionette.LayoutView {
  constructor(...args) {
    this.template = template;

    this.regions = {
      articleRegion: '#article_region',
      writeCommentRegion: '#write_comment_region'
    };

    super(...args);

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
