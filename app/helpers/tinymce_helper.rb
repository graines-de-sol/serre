module TinymceHelper

  # Init TinyMCE according to params
  def t_init(args)

    # default settings
    args[:width]  ||= '738'
    args[:height] ||= '260'
    args[:css]    ||= '/javascripts/tinymce/bootstrap.css'

    out =   "<script src='/javascripts/tinymce/jscripts/tiny_mce/tiny_mce.js' type='text/javascript'></script>"
    out <<  "<script language='javascript' type='text/javascript'>"
    out <<  "$('.content_container').each(function(){"
    out <<  "  $(this).next('.textarea_container').append(\"<textarea name='#{args[:name]}' class='expandable MCEeditable'>\"+$(this).html()+\"</textarea>\")"
    out <<  "});"

    # Toolbars and stuff...
    out << "tinyMCE.init({"
    out << "  mode : 'textareas',"
    out << "  editor_selector : 'MCEeditable',"
    out << "  theme : 'advanced',"
    out << "  skin : 'o2k7',"
    out << "  skin_variant : 'silver',"
    out << "  plugins : 'safari,xhtmlxtras,media,paste,table',"
    out << "  language : 'fr',"
    out << "  height: '#{args[:height]}px',"
    out << "  width: '#{args[:width]}px',"
    out << "  content_css : '#{args[:css]}',"
    out << "  theme_advanced_buttons1 : 'bold,italic,underline,strikethrough,bullist,numlist,blockquote,justifyleft,justifycenter,justifyright,formatselect,link,unlink,image,pasteword,|,tablecontrols',"
    out << "  theme_advanced_buttons2 : '',"
    out << "  theme_advanced_buttons3 : '',"
    out << "  theme_advanced_toolbar_location : 'top',"
    out << "  theme_advanced_toolbar_align: 'left',"
    out << "  theme_advanced_resizing: true,"
    out << "  entity_encoding: 'raw',"

    if args[:relative]
      out << "  relative_urls : false,"
      out << "  remove_script_host : false,"
      out << "  document_base_url : 'http://#{$conf.app_url}'"
    else
      out << "  relative_urls : true"
    end

    out << "})"
    out << "</script>"

    out.html_safe

  end

end

