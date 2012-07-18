$ ->
  # Push vote and launch current survey's modal
  $('.answer').click ->
    $("#survey_modal").modal()
    $("#survey_modal .modal-header h3").text $('#question').text()

    $.ajax
      url: '/surveys'
      type: 'POST'
      data:
        id: $('#current_survey_id').val()
        vote: $(this).val()
      success : (data) ->
        $('#survey_modal .modal-body').html data

  # Show current survey's results
  $('.doshow_results').click ->
    $('#show_results').modal()
    $.ajax
      url: '/admin/surveys/show_results/'+$(this).data('id')
      type: 'GET'
      success : (data) ->
        $('.modal-body #results').html data

  # Show older survey's result in modal
  $('#older_surveys ul li a').click ->
    $("#survey_modal").modal()
    $("#survey_modal .modal-header h3").text $(this).text()

    $.ajax
      url: '/surveys'
      type: 'POST'
      data:
        id: $(this).data('survey_id')
      success : (data) ->
        $('#survey_modal .modal-body').html data

