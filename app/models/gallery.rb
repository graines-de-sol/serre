class Gallery < ActiveRecord::Base

  validates_presence_of :image

  image_accessor :image

end

