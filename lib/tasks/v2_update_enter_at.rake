#encoding: utf-8

task :update_enter_at => :environment do

  Member.all.each do |member|
    unless member.entered_at
      member.update_attributes(:entered_at => Time.now)

      puts "updated member #{member.last_name}"
    else
      puts "did not update member #{member.last_name}"
    end
    
  end

end

