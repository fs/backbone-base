define [
  'collections/app'
  'models/article'
], (AppCollection, ArticleModel) ->

  class ArticleCollection extends AppCollection
    url: 'api/articles'
    model: ArticleModel

    saveArticle: (data) ->
      note = new @model(data)
      note.save()
      @add(note)
