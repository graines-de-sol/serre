$ ->
  # Tooltip init
  $("a[rel='tooltip']").tooltip()

  jQuery('body').linkify()

  $('.dotoggle').click ->
    $($(this).data('block')).slideToggle()

  # Auto expandable textareas
  #$('textarea.expandable').autogrow()

  # Date picker init
  $('.datepicker').datepicker
    dateFormat:'DD dd MM yy'
    altField: '#end_at'
    altFormat: 'yy-mm-dd'

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
    
  $("[data-do='filterBySkill']").click ->
    for resume in $('.member_resume')
      if $(resume).data('skills') .indexOf($(this).data('skill-id')) > -1
        $(resume).fadeIn()
      else
        $(resume).fadeOut() 

  $("[data-do='filterByStatus']").click ->
    for resume in $('.member_resume')
      if $(resume).data('status') .indexOf($(this).data('status-id')) > -1
        $(resume).fadeIn()
      else
        $(resume).fadeOut() 

  $("#do-skillsToAdd").on('click', 'a', ->
    that = $(this)
    $.ajax
      url: '/members/tags/add'
      type: 'POST'
      data:
        tag_name: that.data('tag-name'),
        member_id: that.data('member-id')

      success : (data) ->
        that.attr('title', "Cliquer pour retirer cette compétence")
        $('#do-skillsToremove').prepend that
  )
    
  $("#do-skillsToremove").on('click', 'a', ->
    that = $(this)
    $.ajax
      url: '/members/tags/remove'
      type: 'POST'
      data:
        tag_name: that.data('tag-name'),
        member_id: that.data('member-id')

      success : (data) ->
        that.attr('title', "Cliquer pour ajouter cette compétence")
        $("#do-skillsToAdd").prepend that    
  )

  $("#do-statusToAdd").on('click', 'a', ->
    that = $(this)
    $.ajax
      url: '/members/status/add'
      type: 'POST'
      data:
        tag_name: that.data('tag-name'),
        member_id: that.data('member-id')

      success : (data) ->
        that.attr('title', "Cliquer pour retirer ce statut")
        $('#do-statusToremove').prepend that

    return false
  )
    
  $("#do-statusToremove").on('click', 'a', ->
    that = $(this)
    $.ajax
      url: '/members/status/remove'
      type: 'POST'
      data:
        tag_name: that.data('tag-name'),
        member_id: that.data('member-id')

      success : (data) ->
        that.attr('title', "Cliquer pour ajouter ce statut")
        $("#do-statusToAdd").prepend that  

    return false  
  )

  $("[data-do='searchMember']").keyup ->
    if $(this).val().length > 2
      for resume in $('.member_resume')
        if $(resume).data('first-name').substring(0, $(this).val().length) == $(this).val() || $(resume).data('last-name').substring(0, $(this).val().length) == $(this).val()
          $(resume).fadeIn()
        else
          $(resume).fadeOut() 
    else
      for resume in $('.member_resume')
        $(resume).fadeIn()


# 00 padding for dates/times
window.pad2 = (number) ->
  if number < 10 
    '0' + number
  else
    '' + number