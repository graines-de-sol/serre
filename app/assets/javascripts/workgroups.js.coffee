$ ->
  i = 0
  $("#media_uploader").fineUploader(
    request:
      endpoint: "/workgroups/"+$('#workgroup_id').val()+"/upload_file"
      params:
        'authenticity_token': $("meta[name='csrf-token']").attr("content"),
        'workgroup[name]': $('#media_name').val()
    text:
      uploadButton: $('#uploader_label').val()
  ).on('submit', (event, id, name, responseJSON) ->
    i++ 
  ).on('complete', (id, name, response) ->
    i--
    if i == 0
      window.location.reload()
  )

  i = 0
  $("#photos_uploader").fineUploader(
    request:
      endpoint: "/workgroups/"+$('#workgroup_id').val()+"/upload_photo"
      params:
        'authenticity_token': $("meta[name='csrf-token']").attr("content"),
        'workgroup_category_id': $('#workgroup_id').val()
    text:
      uploadButton: $('#uploader_label').val()
  ).on('submit', (event, id, name, responseJSON) ->
    i++ 
  ).on('complete', (id, name, response) ->
    i--
    if i == 0
      window.location.reload()
  )