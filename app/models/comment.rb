class Comment < ActiveRecord::Base

  belongs_to :post
  belongs_to :member
  belongs_to :workgroup_category

  scope :last_published, where(['workgroup_category_id IS NULL']).order('created_at DESC').limit(3)
end

