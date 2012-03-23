$ ->
  # Tooltip init
  $("a[rel='tooltip']").tooltip()

  # Validation error messaging init
  $('.error_popover').each ->
    $(this).attr('rel','popover')
    $(this).attr('data-original-title', 'Oooops')
    $(this).attr('data-content',$(this).text())
    $(this).text('')
    $(this).popover('show')

  $('.dotoggle').click ->
    $($(this).data('block')).slideToggle()

  # Auto expandable textareas
  $('textarea.expandable').autogrow()

  # Date picker init
  $('.datepicker').datepicker(dateFormat:'DD dd MM yy')

  # Modal mail form
  $('.mail_me').click ->
    $('#recipient').html $(this).data('recipient')
    $('#recipient_id').val $(this).data('recipient_id')

  # Launch ad creation modal
  $('#toggle_ad_creator').click ->
    default_category_id = $('#default_category_id').val()
    default_time = $('#default_time').val()

    $('#create_ad .modal-header h3').text($(this).text())
    $('#id').val ''
    $('#ad_subject').val ''
    $('#ad_body').val ''
    $('#end_at').val default_time
    $('#category_id option[value='+default_category_id+']').attr("selected", "selected")
    $('#ad_location_id option[value=0]').attr("selected", "selected")

  # Launch ad editor modal
  $('.edit_ad').click ->
    ad_id = $(this).data('ad_id')
    category_id = $('#ad_id_'+ad_id+' input.category_id').val()
    location_id = $('#ad_id_'+ad_id+' input.location_id').val()

    $('#create_ad .modal-header h3').text($(this).text())
    $('#id').val ad_id
    $('#ad_subject').val $('#ad_id_'+ad_id+' h3').text()
    $('#ad_body').val $('#ad_id_'+ad_id+' p').text()
    $('#end_at').val $('#ad_id_'+ad_id+' input.end_at').val()
    $('#category_id option[value='+category_id+']').attr("selected", "selected")
    $('#ad_location_id option[value='+location_id+']').attr("selected", "selected")

  # Filter ads by categories
  $('#categories ul li a').click ->
    $('#categories ul li a').attr('id','')
    category_id = parseInt($(this).data('category_id'))
    $('.ad').each ->
      if category_id == 0
        $(this).show()
      else
        this_category = parseInt($('input.category_id', this).val())
        if this_category == category_id
          $(this).show()
        else
          $(this).hide()
    $(this).attr('id', 'active')

  # Push vote and launch current survey's modal
  $('.answer').click ->
    $("#survey_modal").modal()
    $("#survey_modal .modal-header h3").text $('#question').text()

    $.ajax
      url: '/dashboard/survey'
      type: 'PUT'
      data:
        survey_id:$('#current_survey_id').val()
        vote:$(this).val()
      success : (data) ->
        $('#survey_modal .modal-body').html data

  # Show survey's result in modal
  $('#older_surveys ul li a').click ->
    $("#survey_modal").modal()
    $("#survey_modal .modal-header h3").text $(this).text()

    $.ajax
      url: '/dashboard/survey'
      type: 'PUT'
      data:
        survey_id:$(this).data('survey_id')
      success : (data) ->
        $('#survey_modal .modal-body').html data

  # Animate gauge when admin
  $('#rate.draggable').draggable
    axis : 'x',
    containment: 'parent',
    cursor: 'move',
    start: (event,ui) ->
      $('#rate').text('<>')
    stop : (event, ui) ->
      $.ajax
        url: '/admin/occupation'
        type: 'PUT'
        data:
          location_id:$('#locations_select').val(),
          rate:computeRate($(this))
        success : (data) ->
          $('#rate.draggable').text(computeRate($('#rate.draggable')))

  # Position gauge on location selection
  $('#locations_select').change ->
    $('#rate').css('left':'0px')
    $('#rate').text('0%')
    setGauge $(this).val()

  # Position gauge on page loading
  setGauge $('#locations_select').val()

  # Show survey's results
  $('.doshow_results').click ->
    $('#show_results').modal()
    $.ajax
      url: '/admin/surveys/show_results/'+$(this).data('id')
      type: 'GET'
      success : (data) ->
        $('.modal-body #results').html data

# Compute rate value
computeRate = (e) ->
  m_left = e.css('left').split('px')[0]
  # 298 is the size of the gauge container
  percentage = Math.round((m_left/298)*100)
  out = percentage+'%'

# Compute margin-left for rate from occupation
computeMargin = (percentage) ->
  percentage = Math.round((298*percentage)/100)

# Move gauge when location changes
setGauge = (id) ->
  $('.occupation').addClass('hide')
  $('#location_id_'+id).removeClass('hide')
  occupation =  $('#location_id_'+id).data('occupation')
  if $('#rate').hasClass('draggable')
    $('#rate').animate(
      'left':computeMargin(occupation)
    )
  else
    $('#rate').animate(
      'marginLeft':computeMargin(occupation)
    )
  $('#rate').text(occupation+'%')

