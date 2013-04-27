class Voicetalk.Models.Video extends Backbone.RelationalModel
  paramRoot: 'video'
  defaults:
    title: null

  relations: [{
    type: Backbone.HasMany,
    key: 'comments',
    relatedModel: 'Voicetalk.Models.Comment'
    collectionType: 'Voicetalk.Collections.CommentsCollection'
    includeInJSON: true
    reverseRelation: {
      key: 'video_id',
      includeInJSON: '_id'

    }
  }]
class Voicetalk.Collections.VideosCollection extends Backbone.Collection
  model: Voicetalk.Models.Video
  url: '/videos'