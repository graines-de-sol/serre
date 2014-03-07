class Gallery < ActiveRecord::Base

  has_many :pictures, :dependent => :destroy

  validates_presence_of :name
  validates_presence_of :event_at

  def self.last_pictures
    if Gallery.last
      Gallery.last.pictures.order('created_at DESC').limit(6)
    else
      Array.new
    end
  end

end

