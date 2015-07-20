import AppCollection from 'scripts/collections/app';
import Article from 'scripts/models/article';

export default class Articles extends AppCollection {
  constructor(...args) {
    this.url = 'articles';
    this.model = Article;

    super(...args);
  }
}
