AppCollection = require('../collections/app')
Comment = require('../models/comment')

class Comments extends AppCollection
  model: Comment

module.exports = Comments
