$ ->
  # Launch ad creation modal
  $('#toggle_ad_creator').click ->
    $('#create_ad').modal()
    default_category_id = $('#default_category_id').val()
    default_end_at = $.datepicker.parseDate('yy-mm-dd', $('#default_end_at').val())

    $('#create_ad .modal-header h3').text($(this).text())
    $('#ad_id').val ''
    $('#ad_subject').val ''
    $('#ad_body').val ''

    $('#show_end_date').val $.datepicker.formatDate('DD dd MM yy', default_end_at)
    $('#end_at').val $('#default_end_at').val()
    $('#delete_ad_link').hide()
    $('#category_id option[value='+default_category_id+']').attr("selected", "selected")
    $('#ad_location_id option[value=0]').attr("selected", "selected")

  # Launch ad editor modal
  $('.edit_ad').click ->
    ad_id = $(this).data('ad-id')
    category_id = $('#ad_id_'+ad_id+' input.category_id').val()
    location_id = $('#ad_id_'+ad_id+' input.location_id').val()
    default_end_at = $.datepicker.parseDate('yy-mm-dd', $('#ad_id_'+ad_id+' input.end_at').val())

    $('#create_ad .modal-header h3').text($(this).text())
    $('#ad_id').val ad_id
    $('#delete_ad_link').attr('href', '/ads/'+ad_id)
    $('#ad_subject').val $('#ad_id_'+ad_id+' h3').text()

    #$('.content_container').text('huuuuu')
    tinyMCE.execInstanceCommand('wisiwig', "mceInsertContent", false, $('#ad_id_'+ad_id+' .ad_body').html());
    #tinyMCE.get('ad_body').setContent('<span>some</span> html');
    #$('#ad_body').val $('#ad_id_'+ad_id+' p').text()

    $('#show_end_date').val $.datepicker.formatDate('DD dd MM yy', default_end_at)
    $('#end_at').val $('#ad_id_'+ad_id+' input.end_at').val()
    $('#delete_ad').attr('href', '/ads/'+ad_id)
    $('#category_id option[value='+category_id+']').attr("selected", "selected")
    $('#ad_location_id option[value='+location_id+']').attr("selected", "selected")
    $('#delete_ad_link').show()

  # Filter ads by categories
  $('#ads-categories ul li a').click ->
    $('#ads-categories ul li a').attr('id','')
    category_id = parseInt($(this).data('category-id'))
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

