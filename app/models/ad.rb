class Ad < ActiveRecord::Base
  belongs_to :category
  belongs_to :member

  scope :all_categories_for_location, lambda {|member|
    self.where(['end_at > ? AND (location_id = 0 OR location_id = ? OR member_id = ?)', Time.now, member.location_id, member.id]).order('ads.created_at DESC').includes(:member)
  }

  scope :published, lambda {
    self.where(['end_at > ?', Time.now - 1.day]).order('created_at DESC')
  }

  scope :last_published, lambda {
    self.where(['end_at > ?', Time.now - 1.day]).order('created_at DESC').limit(10)
  } 
  
  scope :lasts_4, lambda {
    self.where(['end_at > ?', Time.now - 1.day]).order('created_at DESC').limit(4)
  }

  def unpublish
    self.update_attributes(:end_at => Time.now - 1.day)
  end

end

