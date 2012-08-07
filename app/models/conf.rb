class Conf < ActiveRecord::Base

  has_many  :locations

  image_accessor :default_avatar
  image_accessor :newsletter_header

end

