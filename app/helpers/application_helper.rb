module ApplicationHelper

  # Say hello
  def hello
    Time.now.hour > 18 ? t(:good_evening) : t(:good_morning)
  end

  # Left menu tabs, remove/add you own here
  def tabs
    tabs = [
      {:name   => 'dashboard',
       :icon   => 'icon-home icon-white',
       :url    => 'dashboard'
      },
      {:name   => 'members',
       :icon   => 'icon-search icon-white',
       :url    => 'members'
      },
      {:name   => 'meetings',
       :icon   => 'icon-time icon-white',
       :url    => 'pages/meetings'
      },
      {:name   => 'events',
       :icon   => 'icon-glass icon-white',
       :url    => 'pages/events'
      }
    ]
  end

  # Which role are you playing ?
  def is_admin
    (current_user.role == 'admin' && !current_user.view_as_user) ? true : false
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

  # Format gauge with for surveys
  def gauge(percentage)
    (((percentage.to_f/100.to_f)*490.to_f)+30.to_f).to_i
  end

  # Fulfill Google calendar code
  def show_calendar(cal)
    '<iframe src="'+cal+'" style="border-width:0" width="875" height="600" frameborder="0" scrolling="no"></iframe>' if cal
  end

  # Fulfill Embed video snippet
  def show_video(vid)
    '<iframe width="560" height="315" src="http://'+vid+'" frameborder="0" allowfullscreen></iframe>' if vid
  end
end

