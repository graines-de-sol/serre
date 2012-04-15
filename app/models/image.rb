class Image < ActiveRecord::Base

  belongs_to :article

  validates_presence_of :image

  image_accessor :image

end

