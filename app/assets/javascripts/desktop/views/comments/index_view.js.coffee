Voicetalk.Views.Comments ||= {}

class Voicetalk.Views.CommentsList extends Backbone.View
  template: JST["desktop/templates/comments/index"]

  initialize: () ->
    @options.comments.bind('reset', @addAll)

  addAll: () =>
    @options.comments.each(@addOne)

  addOne: (comment) =>
    view = new Voicetalk.Views.CommentView({model : comment})
    @$("ul").append(view.render().el)

  render: =>
    $(@el).html(@template(comments: @options.comments.toJSON() ))
    @addAll()

    return this
