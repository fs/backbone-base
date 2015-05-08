AppModel = require('scripts/models/app')
Comments = require('scripts/collections/comments')

class Article extends AppModel
  urlRoot: 'articles'

  defaults:
    comments_count: 0

  validation:
    text:
      required: true
    title:
      required: true

  parse: (response) ->
    if response.comments
      @set('comments', new Comments(response.comments))
      delete response.comments

    super

module.exports = Article
