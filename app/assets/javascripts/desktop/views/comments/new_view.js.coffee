Voicetalk.Views.Comments ||= {}

class Voicetalk.Views.CommentNew extends Backbone.View
  template: JST["desktop/templates/comments/new"]
  events:
    "keypress .content": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    console.log(@collection)
    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    if e.keyCode == 13 and @$('.content').val() != ''
      @model.unset("errors")
      @model.set('text', @$('.content').val())
      console.log(@collection.video_id.get('_id'))
      #@model.set('video_id', @collection.video_id)
      console.log(@model)
      @collection.create(@model.toJSON(),
        success: (comment) =>
          view = new Voicetalk.Views.CommentView({model : comment})
          $(@.el).parent().prev().find('.comments-list').append(view.render().el)
          @$('.content').val('')

        error: (comment, jqXHR) =>
          @model.set({errors: $.parseJSON(jqXHR.responseText)})
      )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    return this
