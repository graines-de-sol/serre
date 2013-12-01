#encoding: utf-8

task :update_enter_at => :environment do

  Member.all.each do |member|
    member.update_attributes(:entered_at => Time.now)
  end

end

