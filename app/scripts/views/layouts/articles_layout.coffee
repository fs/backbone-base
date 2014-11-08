ArticlesListView = require('../../views/articles/list.coffee')
ArticlesFormView = require('../../views/articles/form.coffee')
template = require('../../../templates/layouts/articles_layout.jade')

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
