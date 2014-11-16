define [
  'models/app'
  'helpers/config_helper'
  'collections/comments'
], (
  AppModel
  Config
  Comments
) ->

  class Article extends AppModel
    urlRoot: "#{Config.getUrl()}/articles"

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
