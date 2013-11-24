class Gallery < ActiveRecord::Base

  has_many :pictures, :dependent => :destroy

  validates_presence_of :name
  validates_presence_of :event_at
end

