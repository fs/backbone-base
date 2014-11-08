ArticleItemView = require('../../views/articles/item.coffee')

class ArticlesListView extends Marionette.CollectionView
  className: 'articles'
  childView: ArticleItemView

module.exports = ArticlesListView
