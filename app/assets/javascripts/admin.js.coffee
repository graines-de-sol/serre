$ ->
  # Toggle Media description block
  $('.doToggleMediaDescription').click ->
    $(this).closest('.col-md-5').next('.category_description').slideToggle('slow')

