class Picture < ActiveRecord::Base

  validates_presence_of :image

  image_accessor :image

  belongs_to :gallery
  belongs_to :workgroup_category


end

