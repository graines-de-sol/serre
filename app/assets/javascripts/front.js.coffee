$ ->
  $(".tooltip").tooltip()
  $('.error_popover').each ->
    $(this).attr('rel','popover')
    $(this).attr('data-original-title', 'Oooops')
    $(this).attr('data-content',$(this).text())
    $(this).text('')
    $(this).popover('show')

  $('.dotoggle').click ->
    target = $(this).data('target')
    $('#'+target).slideToggle()
    return false

  # Auto expandable textareas
  $('textarea.expandable').autogrow()

  # Modal mail form
  $('.mail_me').click ->
    $('#recipient').html $(this).data('recipient')
    $('#recipient_id').val $(this).data('recipient_id')

