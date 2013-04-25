class Voicetalk.Views.UploadsIndex extends Backbone.View
  el: '#upload-page'
  events:
    'click .icon-cloud-upload, .text': 'uploadTrigger'

  initialize: () ->
    t = this
    $("#new_video").fileupload
      maxFileSize: 268435456
      minFileSize: 1024
      acceptFileTypes: /(\.|\/)(mp4|flv|mkv|avi|mpg|mpeg|dat|vob|ts|wmv)$/i
      url: '/videos'
      start: (e) ->
        t.$el.find('.input').addClass('loading')
      added: (e, data) ->
        jqXHR = data.submit()
        t.$el.find('.btn-danger').click(() ->
          jqXHR.abort()
        )
      progress: (e, data) ->
        progress = parseInt(data.loaded / data.total * 100, 10)
        t.$el.find('.input .progress .bar').css({width: "#{progress}%"})
      done: (e, data) ->
        t.$el.find('.input').removeClass('loading').addClass('done')
        t.$el.find('.btn-success').data('id', data.result._id).click((evt) ->
          window.location = "/videos/#{$(evt.currentTarget).data('id')}"
        )
      fail: (e, data) ->
        t.$el.find('.input').removeClass('loading')

  uploadTrigger: () ->
    @$el.find('#new_video > input').click()