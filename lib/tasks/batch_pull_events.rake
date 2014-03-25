#encoding: utf-8

task :pull_events => :environment do

  require 'open-uri'
  require 'net/https'
  require 'iconv'
  require 'nokogiri'

  agenda = []

  url = Calendar.find(1).rss
  doc = Nokogiri::XML(open("#{url}?orderby=starttime&sortorder=ascending&futureevents=true&max-results=300"))

  events = doc.xpath(" //xmlns:feed/xmlns:entry")
  
  events.each do |event|

    detail = event.xpath('xmlns:link').attr('href').value

    doc = Nokogiri::HTML(open(detail))

    # Description
    block = doc.css("div").map {|node| node.children.text}
    block[5] == "Date" ? description = "" : description = block[5]

    # Date 
    dates = doc.css("time")
    start_at = dates[0]['datetime']
    end_at   = dates[1]['datetime']

    # Title 
    title = doc.at_xpath('//title').inner_text.inspect.gsub(/"/, '')

    # Location
    loc = block[3].split(')Where')[1] 
    if loc
      loc = loc.split('(map)').first
    else
      loc = nil
    end

    if start_at.to_time > Time.now
      agenda.push({ 
        :start_at => start_at.to_time,
        :end_at   => end_at.to_time,
        :title    => title,
        :description  => description,
        :location => loc,
        :id       => detail.split('https://www.google.com/calendar/event?eid=').last
      })
    end

  end

  agenda.each do |event|

    #puts "Event at #{event[:start_at].to_date}"
    event_exists = Event.where(['event_id = ?', event[:id]]).first

    if event[:description]
      desc = "#{Iconv.conv("iso-8859-1", "UTF8", event[:description].gsub(/\\/, ""))}".force_encoding('UTF-8')
    end

    if event[:title]
      title = "#{Iconv.conv("iso-8859-1", "UTF8", event[:title].gsub(/\\/, ""))}".force_encoding('UTF-8')
    end
    
    if event[:location]
      location = "#{Iconv.conv("iso-8859-1", "UTF8", event[:location].gsub(/\\/, ""))}".force_encoding('UTF-8')
      puts location
    end

    if event_exists

      event_exists.update_attributes(
        :start_at => event[:start_at].to_datetime, 
        :end_at => event[:end_at].to_datetime, 
        :title => title, 
        :location => location,
        :description => desc
      )

      puts "Updated event id #{event[:id]}"

    else

      Event.create(
        :start_at => event[:start_at].to_datetime, 
        :end_at => event[:end_at].to_datetime, 
        :title => title, 
        :description => desc,
        :event_id => event[:id],
        :location => location,
        :calendar_id => 1
      )        

      puts "Inserted event id #{event[:id]}"
    end

  end

end

