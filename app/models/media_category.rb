class MediaCategory < ActiveRecord::Base

  has_many :medias, :dependent => :destroy

  scope :published, self.where(:published => true)

end

