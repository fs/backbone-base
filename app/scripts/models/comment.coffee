AppModel = require('../models/app.coffee')

class Comment extends AppModel
  defaults:
    'articleId': '',
    'user': 'User',
    'comment': 'Comment'
    'avatar': 'http://localhost:8000/images/avatar.png' # TO DO: url root should be replaced by the url root form configuration class

module.exports = Comment
