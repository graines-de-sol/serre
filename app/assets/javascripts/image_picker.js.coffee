$ ->
  ajaxUploader('upload_image', '/admin/pages/images/upload')
#  request = $.post '/admin/image_picker/get_folders'
#  request.success (data) ->
#    for folder in data
#      $('#folders').append "<option value='"+folder.id+"'>"+folder.name+"</option>"
#      if !window.default_folder
#        window.default_folder = folder.id

#    $('#site_id').val(data[0].site_id)

#    window.updateImages(window.default_folder)

#  $(document).delegate '#folders', 'change', (event) ->
#    window.updateImages(this.value)

#  $(document).delegate 'img', 'click', (event) ->
#    if $('#picker_type').val() == 'editor'
#      # 'coming from TinyMCE editor
#      image_path = this.src.split('/')
#      image_name = image_path[4]+'/'+image_path[5]

#      $('#alt').val(parent.window.opener.$('#article_title').val())
#      $('#src').val('/sites/'+$('#site_id').val()+'/medias/images/'+image_name);
#      ImageDialog.update();
#    else
#      # Coming from gallery or slideshow picker
#      window.opener.addImage(this.src)

#    $(this).fadeOut('slow').fadeIn('slow')
#    return false

## Refresh after image upload
#window.refresh = (path, file, occupied, quota, success) ->
#  dir = path.split('/')
#  window.updateImages(dir[3])

### Refresh images preview
#window.updateImages = (dir) ->

#  ajaxUploader('upload_image', '/medias/images/'+dir)

#  $('#image_preview_container').empty()
#  $.post '/admin/image_picker/'
#    id : dir
#    success = (data) ->
#      for image in data
#        if image != '.' && image != '..'
#          image_preview  = "<div class='image'>"
#          image_preview += "  <a href='#' title='Cliquez pour s&eacute;lectionner' class='image_thumbnail'>"
#          image_preview += "   <img src='/thumbnailer/"+dir+"/"+image+"/autox120' />"
#          image_preview += "  </a>"
#          image_preview += "  <div class='image_description'>"
#          image_preview += "    <a href='#'>"+image+"</a>"
#          image_preview += "  </div>"
#          image_preview += "</div>"

#          $('#image_preview_container').append image_preview

