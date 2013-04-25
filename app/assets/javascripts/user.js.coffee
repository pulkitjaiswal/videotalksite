$(document).ready ()->
  $('.dropdown-toggle').dropdown()
  $("#fileupload").fileupload
    autoUpload: true
    url: '/upload_avatar'
    added: (e, data) ->
      reader = new FileReader()
      data.doms = []
      _.each(data.files, (file) ->
        dom = $('<li><div class="image">
                      <i class="icon-remove"></i>
                      <img style="width: 96px; height: 96px;"/>
                  </div></li>')
        reader.onload = (event) -> dom.find('img').get(0).src = event.target.result
        reader.readAsDataURL(file)
        data.doms.push(dom)
        $(".thumbnails").append(dom)
      )
    done: (e, data) ->
      _.each(data.doms, (dom, index) ->
        console.log(data.result[index].upload_id)
        dom.find('.image').attr('data-id', data.result[index].upload_id)
        dom.find('img').get(0).src = data.result[index].thumbnail_url
      )
  $(".image").click () ->
    $('img.active').removeClass('active')
    $(this).find('img').addClass('active')
    $.ajax({
      type: 'POST',
      url: '/update_avatar',
      async: true,
      dataType: 'json',
      data: {id: $(this).attr('data-id')},
      success: (data) ->
        $('.avatar').find('img').attr('src',data.url)
    })




