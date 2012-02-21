$ ->
  $(".tooltip").tooltip()

  $('.dotoggle').click ->
    target = $(this).data('target')
    $('#'+target).slideToggle()
    return false

