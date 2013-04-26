class Voicetalk.Views.Comments extends Backbone.View
  el: '.box-comment'
  template: JST["desktop/templates/videos/comment"]
  render: ->
    $(@el).html(@template())
    video = @options.video
    cs = video.get('comments')
    comments_view = new Voicetalk.Views.CommentsList(comments: cs)
    new_comment_view = new Voicetalk.Views.CommentNew(collection: cs)
    @$(".comments").html(comments_view.render().el)
    @$(".new_comment").html(new_comment_view.render().el)
