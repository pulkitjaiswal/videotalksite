class Voicetalk.Routers.VideosRouter extends Backbone.Router
  initialize: (options) ->
    @video = new Voicetalk.Models.Video(options.video)

  routes:
    "/new"      : "newVideo"
    "/index"    : "index"
    "/:id/edit" : "edit"
    "/:id"      : "show"
    ".*"        : "show_comment"

  newVideo: ->


  index: ->


  show_comment: ->
    video = @video
    comments = new Voicetalk.Views.Comments({video: video})
    comments.render()
  edit: (id) ->

