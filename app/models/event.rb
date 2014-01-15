class Event < ActiveRecord::Base

  belongs_to :calendar
  has_many :participants
  has_many :members, :through => :participants

  def self.upcoming
    Event.where(['start_at > ?', Time.now]).limit(4)
  end

end

