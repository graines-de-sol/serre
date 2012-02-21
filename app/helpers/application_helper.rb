module ApplicationHelper

  # Say hello
  def hello
    Time.now.hour > 18 ? t(:good_evening) : t(:good_morning)
  end

  # Left menu tabs, remove/add you own here
  def tabs
    tabs = [
      {:name       => 'dashboard',
       :icon       => 'icon-home icon-white',
       :controller => 'dashboard'
      },
      {:name       => 'members',
       :icon       => 'icon-search icon-white',
       :controller => 'members'
      }
    ]
  end

  # Which role are you playing ?
  def is_admin
    current_user.role == 'admin' ? true : false
  end

  # Generate I18n for JS
  def translate_to_client(strings)
    translations = "<script>"
    translations << "if(!I18n){var I18n = {};};"
    strings.each do |s|
      translations << 'I18n["'+s+'"] = "'+t('warnings.'+s)+'";'
    end
    translations << "</script>"
  end

end

