Voicetalk.Views.Comments ||= {}

class Voicetalk.Views.CommentView extends Backbone.View
  template: JST["desktop/templates/comments/view"]

  events:
    "click .destroy" : "destroy"

  tagName: "li"

  destroy: () ->
    @model.destroy()
    console.log(@model)
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
