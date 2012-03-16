$ ->
  # Tooltip init
  $('.tooltip').tooltip()

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
    $('#ad_body').val $('#ad_id_'+ad_id+' pre').text()
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

  # Launch survey's modal
  $('.answer').click ->
    $("#survey_modal").modal()

    $.ajax
      url: '/dashboard/survey'
      type: 'PUT'
      data:
        polling_id:2
      success : (data) ->
        $('#survey_modal .modal-body').html data

