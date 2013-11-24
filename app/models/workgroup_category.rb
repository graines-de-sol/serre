class WorkgroupCategory < ActiveRecord::Base

  has_many :workgroups, :dependent => :destroy

  scope :published, self.where(:published => true)

end

