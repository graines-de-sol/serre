class Conf < ActiveRecord::Base

  has_many  :locations

  image_accessor :default_avatar

end

