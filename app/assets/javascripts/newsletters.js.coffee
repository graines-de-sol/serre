$ ->
  # Launch register event modal
  $('#selectNewsletter').change ->
    document.location.href = '/admin/newsletters/'+$(this).val()

