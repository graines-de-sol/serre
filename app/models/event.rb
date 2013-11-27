class Event < ActiveRecord::Base

  belongs_to :calendar
  has_many :participants
  has_many :members, :through => :participants
end

