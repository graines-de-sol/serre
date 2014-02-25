class Post < ActiveRecord::Base

  has_many :comments, :dependent => :destroy
  belongs_to :blog_category

  scope :published, lambda {
    self.where(["is_published = ? AND published_at < ?", true,  Time.now])
  }
  scope :last_posts, lambda { |max_post|
    self.where(['published_at <= ?', Time.now]).order('published_at DESC').limit(max_post)
  }
  scope :by_category, lambda{ |category_id|
    self.where(['blog_category_id = ? AND published_at <= ?', category_id, Time.now]).order('published_at DESC')
  }
  scope :by_month, lambda{ |year, month|
    self.where(["YEAR(published_at) = ? AND MONTH(published_at) = ? AND published_at <= ?", year, month, Time.now]).order('published_at DESC')
  }

  def self.archives_by_month
    self.where(['published_at <= ?', Time.now]).order('published_at DESC').group_by{|p| p.published_at.beginning_of_month}
  end


end

