module MimeTypesHelper

  # Show corresponding icons for files mime-types
  def get_type_icon(media)

    case media.mime_type.to_s
    when 'application/msword'
      'word'
    when 'application/vnd.ms-powerpoint', 'application/mspowerpoint', 'application/x-mspowerpoint'
      'powerpoint'
    when 'image/png', 'image/jpg', 'image/jpeg', 'image/gif'
      'picture'
    when 'application/pdf'
      'pdf'
    when 'text/plain'
      'text'
    when 'application/msexcel', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
      'excel'
    else
      'package'
    end

  end

end

