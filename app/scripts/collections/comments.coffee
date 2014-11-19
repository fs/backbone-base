AppCollection = require('scripts/collections/app')
Comment = require('scripts/models/comment')

class Comments extends AppCollection
  model: Comment

module.exports = Comments
