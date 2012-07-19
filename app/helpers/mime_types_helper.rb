module MimeTypesHelper

  # Show corresponding icons for files mime-types
  def get_type_icon(media)
    case(media.mime_type)
    when 'application/msword'
      'word'
    when ('image/png' || 'image/jpg')
      'picture'
    when 'application/pdf'
      'pdf'
    when 'text/plain'
      'text'
    when 'application/msexcel'
      'excel'
    else
      'package'
    end

  end

end

