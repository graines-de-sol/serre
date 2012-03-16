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
      },
      {:name       => 'meetings',
       :icon       => 'icon-time icon-white',
       :controller => 'members'
      },
      {:name       => 'events',
       :icon       => 'icon-glass icon-white',
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

  # Dummy phone numbers formating
  def phone_number(number)
    return "#{number[0..1]} #{number[2..3]} #{number[4..5]} #{number[6..7]} #{number[8..9]}" if @number
  end

  # Display socials networks links and icon if profile exists
  def show_social_profiles(networks)
    out = ''
    networks.each do |network|
      out << "<a href='#{h network[:url]}'><img src='/assets/#{network[:icon]}' /></a>" unless network[:url].blank?
    end

    out.html_safe
  end

  # Check if member has filled in some infos
  def member_has_infos?(member)

    fields = ['organisation', 'prestations', 'references', 'phone', 'city', 'hobbies', 'powers']
    out = false

    fields.each do |f|
      out = true if !member[f].blank?
    end

    return out
  end

  # Check if member has some social networks profiles
  def member_has_profile?(networks)

    out = false

    networks.each do |p|
      out = true if p[:url]
    end

    return out
  end

  # Ouput a member's birthday whenever it is set or not
  def birthday

    @member.birthday ? obj = @member.birthday : obj = Time.now

    begin
      birthday = {
        :day   => obj.day,
        :month => obj.month,
        :year  => obj.year
      }
    rescue
      birthday = {
        :day   => obj['day'].to_i,
        :month => obj['month'].to_i,
        :year  => obj['year'].to_i
      }
    end
  end

  # Show member avatar or default avatar
  def avatar(member, size)
    if member.avatar
      image_tag member.avatar.thumb(size).url, :alt=>"#{member.first_name} #{member.last_name}"
    else
      image_tag $conf.default_avatar.thumb(size).url, :alt=>t('default_avatar')
    end
  end

end

