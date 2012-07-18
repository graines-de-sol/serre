$ ->
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

