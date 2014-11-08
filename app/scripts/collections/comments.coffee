AppCollection = require('../collections/app.coffee')
Comment = require('../models/comment.coffee')

class Comments extends AppCollection
  model: Comment

module.exports = Comments
