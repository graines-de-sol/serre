#encoding: utf-8

task :pull_events => :environment do

  require 'open-uri'
  require 'net/https'
  require 'iconv'
  require 'nokogiri'

  agenda = []

  url = Calendar.find(1).rss
  doc = Nokogiri::XML(open(url))

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

    agenda.push({ 
      :start_at => start_at.to_time,
      :end_at   => end_at.to_time,
      :title    => Iconv.conv("iso-8859-1", "UTF8", title.encode("iso-8859-1")),
      :description  => Iconv.conv("iso-8859-1", "UTF8",description.encode("iso-8859-1")),
      :id       => detail.split('https://www.google.com/calendar/event?eid=').last
    })

  end

  agenda.each do |event|

    event_exists = Event.where(['event_id = ?', event[:id]]).first

    if event_exists

      event_exists.update_attributes(
        :start_at => event[:start_at].to_datetime, 
        :end_at => event[:end_at].to_datetime, 
        :title => event[:title], 
        :description => event[:description]
      )

      puts "Updated event id #{event[:id]}"

    else
      Event.create(
        :start_at => event[:start_at].to_datetime, 
        :end_at => event[:end_at].to_datetime, 
        :title => event[:title], 
        :description => event[:description], 
        :event_id => event[:id],
        :calendar_id => 1
      )        

      puts "Inserted event id #{event[:id]}"
    end

  end

end

