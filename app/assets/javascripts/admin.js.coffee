$ ->
  # Toggle Media description block
  $('.doToggleMediaDescription').click ->
    $(this).closest('.col').next('.category_description').slideToggle('slow')

