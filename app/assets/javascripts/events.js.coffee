$ ->
  # Push vote and launch current survey's modal
  $("[data-do='toggleRegistration']").click ->
    if $(this).data('is') == 'add'
      sure = true
    else
      sure = confirm "Ne plus participer à cet événement ?!"
    
    if sure
      $.ajax
        url: '/events'
        type: 'POST'
        data:
          event_id: $('#toggle_event .modal-body #modal-event-id').val()
          do: $(this).data('is')

        success : (data) ->
          $('#toggle_event').modal('hide');
          alert data

    return false

window.pullEvent = (id) ->
    $.ajax
      url: '/events/'+id
      type: 'GET'

      beforeSend : (data) ->
        $('#toggle_event').modal();

      success : (data) ->
        $('#toggle_event .modal-body #event_participants').empty()
        $('#toggle_event .modal-body #event_title').text(data.event.title)
        $('#toggle_event .modal-header #event_start').text(data.event.start_at)
        $('#toggle_event .modal-body #modal-event-id').val(data.event.event_id)
        $('#toggle_event .modal-body #event_dates').text("De : "+ data.event.start_at_time+" à "+ data.event.end_at_time)
        if data.event.description
          $('#toggle_event .modal-body #event_description').text(data.event.description)
        else
          $('#toggle_event .modal-body #event_description').text("Aucune description")

        participant_ids = []
        if data.participants.length == 0
          $('#toggle_event .modal-body #event_participants').text("Aucun participant pour le moment")
        else
          for participant in data.participants
            participant_ids.push(participant.id)
            $('#toggle_event .modal-body #event_participants').append("<a href='members/"+participant.id+"' target='blank'>» "+participant.first_name+" "+participant.last_name+"</a><br />")

        if participant_ids.indexOf(parseInt($('#event-member-id').val())) > -1
          $('#toggle_event .modal-body #event_register').hide()
          $('#toggle_event .modal-body #event_cancel').show()
        else
          $('#toggle_event .modal-body #event_register').show()
          $('#toggle_event .modal-body #event_cancel').hide()