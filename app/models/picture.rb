class Picture < ActiveRecord::Base

  validates_presence_of :image

  image_accessor :image

  belongs_to :gallery


end

