$ ->
  $('form').submit ->
    showRequired(this)
    return false

  $('form').delegate 'input', 'focus', (event) ->
    $('#required_warning').popover('hide')
    $('#required_warning').remove()
    $(this).removeClass('required')
    $(this).focus()

showRequired = (field) ->
  $('#'+field.id+' :input').each ->
    if $(this).data('required') == true && $(this).val() == ''
      $(this).addClass('required')
      $('html, body').scrollTo(field, 400,
        offset:
          left: 0
          top: -100
      )
      $(this).after('<a href="#" rel="popover" id="required_warning" data-content="'+$(this).data('alert')+'" data-original-title="Ooops"></a>')
      $('#required_warning').popover('show')
      return false

