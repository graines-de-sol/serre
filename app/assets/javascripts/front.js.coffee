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
      if $(resume).data('skills').indexOf($(this).data('skill-id')) > -1
        $(resume).fadeIn()
      else
        $(resume).fadeOut() 

  $("[data-do='filterByStatus']").click ->
    for resume in $('.member_resume')
      if $(resume).data('status').indexOf($(this).data('status-id')) > -1
        $(resume).fadeIn()
      else
        $(resume).fadeOut() 

  $("#do-skillsToAdd").on('click', 'a', ->
    that = $(this)
    $.ajax
      url: '/members/update_skills/add'
      type: 'POST'
      data:
        tag_name: that.data('tag-name'),
        member_id: that.data('member-id')

      success : (data) ->
        that.attr('title', "Cliquer pour retirer cette compétence")
        $('#do-skillsToremove').prepend that
    return false
  )
    
  $("#do-skillsToremove").on('click', 'a', ->
    that = $(this)
    $.ajax
      url: '/members/update_skills/remove'
      type: 'POST'
      data:
        tag_name: that.data('tag-name'),
        member_id: that.data('member-id')

      success : (data) ->
        that.attr('title', "Cliquer pour ajouter cette compétence")
        $("#do-skillsToAdd").prepend that    
    return false
  )

  $("#do-statusToAdd").on('click', 'a', ->
    that = $(this)
    $.ajax
      url: '/members/update_status/add'
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
      url: '/members/update_status/remove'
      type: 'POST'
      data:
        tag_name: that.data('tag-name'),
        member_id: that.data('member-id')

      success : (data) ->
        that.attr('title', "Cliquer pour ajouter ce statut")
        $("#do-statusToAdd").prepend that  

    return false  
  )

  $("#do-specificityToAdd").on('click', 'a', ->
    that = $(this)
    $.ajax
      url: '/members/update_status/add'
      type: 'POST'
      data:
        tag_name: that.data('tag-name'),
        member_id: that.data('member-id')

      success : (data) ->
        that.attr('title', "Cliquer pour retirer ce statut")
        $('#do-specificityToremove').prepend that

    return false
  )
    
  $("#do-specificityToremove").on('click', 'a', ->
    that = $(this)
    $.ajax
      url: '/members/update_status/remove'
      type: 'POST'
      data:
        tag_name: that.data('tag-name'),
        member_id: that.data('member-id')

      success : (data) ->
        that.attr('title', "Cliquer pour ajouter ce statut")
        $("#do-specificityToAdd").prepend that  

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

  $("[data-do='showAllMembers']").click ->
    for resume in $('.member_resume')
      $(resume).fadeIn()

  $('#userCredentials').bind("ajax:success", (data, status, xhr) ->
    $('.modal-errors').hide()
    $('#userCredentials').hide()
    $('.modal-success').show()
  ).bind("ajax:error", (xhr, datas, error) ->
    that = $('.modal-errors')
    that.show()
    messages = ''
    form_errors = JSON.parse(datas.responseText)
    for key, value of form_errors
      messages += "<li>"+value[0]+"</li>"

    that.html("<ul>"+messages+"</ul>")
  )

# 00 padding for dates/times
window.pad2 = (number) ->
  if number < 10 
    '0' + number
  else
    '' + number