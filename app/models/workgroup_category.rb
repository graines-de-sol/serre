class WorkgroupCategory < ActiveRecord::Base

  has_many :workgroups, :dependent => :destroy
  has_many :pictures
  has_many :comments

  scope :published, self.where(:is_published => true)
  scope :public, self.where(:is_public => true)

end

