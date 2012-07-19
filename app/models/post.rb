class Post < ActiveRecord::Base

  has_many :comments
  belongs_to :category

  scope :last_posts, self.order('created_at DESC').limit(5)

  def self.archives_by_month
    self.where(:published => true).order('created_at DESC').group_by{|p| p.created_at.beginning_of_month}
  end

end

