class Article < ActiveRecord::Base
  belongs_to :location

  before_create :strip_calendar_snippet, :strip_video_snippet
  before_update :strip_calendar_snippet, :strip_video_snippet
  normalize_attributes :title, :content, :calendar, :video

private

  # Strip and filter calendar snippet
  def strip_calendar_snippet

    begin
      target = self.calendar.split('"')[1]
      domain = target.split('/')[2].split('www.').last

      # ADD YOUR OWN CALENDAR PROVIDERS HERE (default is google)
      cal_providers = ['google.com']

      if cal_providers.include?(domain)
        self.calendar = target
      else
        self.calendar = nil
      end
    rescue
      self.calendar = nil
    end

  end

  # Strip and filter video embed snipet
  def strip_video_snippet

    begin
      self.video =~ /http:\/\/([^"']+)/

      source = $1
      domain = source.split('/').first

      # ADD YOUR OWN EMBED VIDEO PROVIDERS HERE
      video_providers = ['www.youtube.com', 'player.vimeo.com', 'www.dailymotion.com']

      if video_providers.include?(domain)
        self.video = source
      else
        self.video = nil
      end
    rescue
      self.video = nil
    end

  end
end

