$ ->
  # Push vote and launch current survey's modal
  $('#send_event_registration').click ->
    $('#send_event_registration').hide()

    $.ajax
      url: '/events'
      type: 'POST'
      data:
        event_date: $('#event_date').val()
        event_name: $('#event_name').val()
        user_id:  $('#user_id').val()

      beforeSend : (data) ->
        $('#event_description').empty()
        $('#event_description').append("<img class='loading' src='/assets/round_progress_alpha.gif' />")

      success : (data) ->
        $('#event_description').empty()
        confirm_label = $('#register_ok_message').val()
        $('#event_description').append(confirm_label)

