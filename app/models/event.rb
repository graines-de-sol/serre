class Event < ActiveRecord::Base

  has_many :participants
  has_many :members, :through => :participants
end

