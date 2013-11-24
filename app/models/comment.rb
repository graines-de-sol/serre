class Comment < ActiveRecord::Base

  belongs_to :post
  belongs_to :member

  scope :last_published, order('created_at DESC').limit(3)
end

