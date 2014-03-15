$ ->

  $("[data-do='postComment']").submit ->
    $.ajax
      url: '/comments'
      type: 'POST'
      data:
        comment: $("[data-is='newComment']").val()
        post_id: $(this).data('post')

      success : (data) ->
        window.location.reload()

    return false
    
  $("[data-do='removeComment']").click ->
    confirmation = confirm("Supprimer ce commentaire ?!")

    if confirmation != true
      return false

    post_id = $(this).data('id')
    $.ajax
      url: '/comments/'+post_id
      type: 'DELETE'
      data:
        post_id: post_id

      success : (data) ->
        $("[data-comment-id='row-"+post_id+"']").remove()

    return false

  $("[data-do='formForComment']").click ->
    post_id = $(this).data('id')
    $("[data-comment-id='content-"+post_id+"']").toggle()
    $("[data-comment-id='edit-"+post_id+"']").toggle()

  $("[data-do='updateComment']").submit ->
    comment_id = $(this).data('id')

    $.ajax
      url: '/comments/'+comment_id
      type: 'PUT'
      data:
        comment: $(this).find('textarea').val()

      success : (data) ->
        window.location.reload()

    return false