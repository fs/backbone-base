define [
  'marionette'
  'views/content/content_comment'
  'models/article'
  'collections/comments'
], (Marionette, CommentView, ArticleModel ,CommentsCollection) ->

  class ContentArticleView extends Marionette.CompositeView
    className: 'article'
    template: JST['templates/content/content_article']
    itemView: CommentView
    itemViewContainer: '#comments.media'

    initialize: ->
      
      @_initCollection
      @model.fetch().then =>
        # @$el.html(@template(@model.attributes))

    _fetchModel: ->
      @model = new ArticleModel()
      @model.fetch()
      @model.get('id')

    _initCollection: ->
      @collection = new CommentsCollection()
      @collection.fetch()

    # appendHtml: (collectionView, itemView) ->
    #     # // ensure we nest the child list inside of 
    #     # // the current list item
    #     collectionView.$("li:first").append(itemView.el);

    # render: ->
    #   # console.log @model.attributes
      
