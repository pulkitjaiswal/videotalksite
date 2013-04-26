class Voicetalk.Models.Comment extends Backbone.RelationalModel
  paramRoot: 'comment'

  defaults:
    text: null

class Voicetalk.Collections.CommentsCollection extends Backbone.Collection
  model: Voicetalk.Models.Comment
  url: '/comments'