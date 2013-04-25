#= require_self

#= require_tree ./templates
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./views
#= require_tree ./routers

window.Voicetalk =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Voicetalk.Views.UploadsIndex()
    new Voicetalk.Views.VideosIndex()
$(document).ready ->
  Voicetalk.initialize()
