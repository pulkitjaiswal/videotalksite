class Voicetalk.Views.VideosIndex extends Backbone.View
  el: '#video'
  events:
    'click .shared img': 'btnSocialClick'

  initialize: () ->
    FB.init({appId: "519795961410773", status: true, cookie: true});

  btnSocialClick: (evt) ->
    t = $(evt.currentTarget)
    switch t.data('type')
      when 'facebook'
        return if t.attr('class').indexOf('sharing') != -1
        FB.ui({method: 'feed', redirect_uri: location.href, link: location.href})
      when 'google'
        popup = window.open('https://plusone.google.com/_/+1/confirm?hl=en&url='+location.href+'&title=_TITLE_',"mywindow1","location=1,status=1,scrollbars=1,width=640,height=480")
      when 'twitter'
        popup = window.open('http://twitter.com/share?url='+location.href+'&text=Shared link',"mywindow1","location=1,status=1,scrollbars=1,width=640,height=480")