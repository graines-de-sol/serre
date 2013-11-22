$ ->
  # Tooltip init
  #$("a[rel='tooltip']").tooltip()

  #jQuery('body').linkify()

  $('.dotoggle').click ->
    $($(this).data('block')).slideToggle()

  # Auto expandable textareas
  #$('textarea.expandable').autogrow()

  # Date picker init
  #$('.datepicker').datepicker
  #  dateFormat:'DD dd MM yy'
  #  altField: '#end_at'
  #  altFormat: 'yy-mm-dd'

  # Modal mail form
  $('.mail_me').click ->
    $('#recipient').html $(this).data('recipient')
    $('#recipient_id').val $(this).data('recipient_id')

  $("[data-do='postComment']").submit ->
    $.ajax
      url: '/comments/'+$(this).data('post')
      type: 'PUT'
      data:
        comment: $("[data-is='newComment']").val()
        post_id: $('#event_name').val()

      success : (data) ->
        new_comment = $('#comment-template')
        $('.new-comment-content', new_comment).html(data.comment)
        $('.new-comment-date', new_comment).text(data.date)
        $("[data-is='newComment']").val('')
        new_block = new_comment.clone()
        new_block.removeAttr('id')
        new_block.fadeIn()
        new_block.removeClass('hide').prependTo("#comments")

    return false
    
  $("[data-do='filterByTag']").click ->
    for resume in $('.member_resume')
      if $(resume).data('tags') .indexOf($(this).data('tag-id')) > -1
        $(resume).fadeIn()
      else
        $(resume).fadeOut() 

  $("#do-skillsToAdd").on('click', 'a', ->
    that = $(this)
    $.ajax
      url: '/members/tags/add'
      type: 'POST'
      data:
        tag_name: that.data('tag-name')

      success : (data) ->
        that.attr('title', "Cliquer pour retirer cette compétence")
        $('#do-skillsToremove').append that
  )
    
  $("#do-skillsToremove").on('click', 'a', ->
    that = $(this)
    $.ajax
      url: '/members/tags/remove'
      type: 'POST'
      data:
        tag_name: that.data('tag-name')

      success : (data) ->
        that.attr('title', "Cliquer pour ajouter cette compétence")
        $("#do-skillsToAdd").append that    
  )

  $("#do-statusToAdd").on('click', 'a', ->
    that = $(this)
    $.ajax
      url: '/members/status/add'
      type: 'POST'
      data:
        tag_name: that.data('tag-name')

      success : (data) ->
        that.attr('title', "Cliquer pour retirer ce statut")
        $('#do-statusToremove').append that

    return false
  )
    
  $("#do-statusToremove").on('click', 'a', ->
    that = $(this)
    $.ajax
      url: '/members/status/remove'
      type: 'POST'
      data:
        tag_name: that.data('tag-name')

      success : (data) ->
        that.attr('title', "Cliquer pour ajouter ce statut")
        $("#do-statusToAdd").append that  

    return false  
  )

# 00 padding for dates/times
window.pad2 = (number) ->
  if number < 10 
    '0' + number
  else
    '' + number