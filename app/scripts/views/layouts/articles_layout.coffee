ArticlesListView = require('scripts/views/articles/list')
ArticlesFormView = require('scripts/views/articles/form')
template = require('templates/layouts/articles_layout')

class ArticlesLayout extends Marionette.LayoutView
  template: template

  collectionEvents:
    'add': 'onAddNewArticle'

  regions:
    articlesRegion: '#articles_list_region'
    writeArticleRegion: '#write_article_region'

  onRender: ->
    @articlesRegion.show(new ArticlesListView(collection: @collection))
    @writeArticleRegion.show(new ArticlesFormView(collection: @collection))

  onAddNewArticle: ->
    @writeArticleRegion.show(new ArticlesFormView(collection: @collection))

module.exports = ArticlesLayout
