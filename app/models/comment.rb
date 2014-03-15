class Comment < ActiveRecord::Base

  belongs_to :post
  belongs_to :member
  belongs_to :workgroup_category

  scope :last_published, where(['workgroup_category_id IS NULL']).order('created_at DESC').limit(3)

  def is_editable_by(user)
    if self.member_id == user.member.id || user.role == 'admin'
      return true
    else
      return false
    end
  end

end

