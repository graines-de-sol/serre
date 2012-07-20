module MimeTypesHelper

  # Show corresponding icons for files mime-types
  def get_type_icon(media)
    case(media.mime_type)
    when 'application/msword'
      'word'
    when ('application/mspowerpoint' && 'application/vnd.ms-powerpoint' && 'application/x-mspowerpoint')
    when ('image/png' && 'image/jpg' && 'image/gif')
      'picture'
    when 'application/pdf'
      'pdf'
    when 'text/plain'
      'text'
    when ('application/msexcel' && 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
      'excel'
    else
      'package'
    end

  end

end

