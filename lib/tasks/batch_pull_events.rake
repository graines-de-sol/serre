#encoding: utf-8

task :pull_events => :environment do

  require 'iconv'

  url = Calendar.find(1).rss
  cal_file = open(url)
  cals = Icalendar.parse(cal_file)
  agenda = []

  cals.first.events.each do |event|
    if event.dtstart > Time.now.to_date
      agenda.push({ 
        :start_at => event.dtstart,
        :end_at   => event.dtend,
        :title    => event.summary.to_s,
        :description  => event.description.to_s,
        :location => event.location.to_s,
        :event_id => event.uid.split('@google.com').first.to_s,
        :calendar_id => 1
      })
    end
  end

  # Create / Update
  agenda.each do |event|
    previous_event = Event.where(['event_id = ?', event[:event_id]]).first

    if previous_event
      previous_event.update_attributes(event)
      puts "Updated event id #{event[:id]}"
    else
      Event.create!(event)
      puts "Inserted event id #{event[:id]}"     
    end
  end

  # Delete
  events = Event.where(['start_at > ?', Time.now])
  events.each do |event|
    exists = false
    agenda.each do |e|
      if event.event_id == e[:event_id].to_s
        exists = true
      end
    end

    if !exists
      event.destroy
      puts "Deleted event id #{event.event_id}"   
    end
  end

end

