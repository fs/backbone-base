AppModel = require('../models/app')
Comments = require('../collections/comments')

class Article extends AppModel
  urlRoot: '/api/articles'

  defaults:
    'text': ''
    'comments_count': 0

  validation:
    text:
      required: true

  parse: (response) ->
    if response.comments
      @set('comments', new Comments(response.comments))
      delete response.comments

    super

module.exports = Article
