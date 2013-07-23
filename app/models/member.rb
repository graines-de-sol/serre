class Member < ActiveRecord::Base

  belongs_to :location
  belongs_to :status
  belongs_to :user

  has_many :ads, :dependent => :destroy
  has_many :networks, :through=>:profiles
  has_many :profiles
  has_many :comments, :dependent => :destroy

  validates_presence_of :first_name
  before_update :compose_birthday

  image_accessor :avatar
  image_accessor :logo

  normalize_attributes :website, :baseline, :organisation, :presence, :prestations, :references, :city, :hobbies, :powers, :organisation_2, :website_2, :logo_uid
  normalize_attribute :phone, :mobile, :with=>:phone

  acts_as_birthday :birthday

  scope :www_published, self.where(['www_published = ? AND is_active = ?', true, true])
  scope :active, self.where(['is_active = ?', true])

  # Weither a user can edit or just view a given content
  def self.can_edit?(current_user, member_id)
    ((current_user.role == 'admin' && !current_user.view_as_user) || current_user.member.id == member_id) ? true : false
  end

  # Search member by column and keywords
  def self.search_by(category, keywords, is_active)
    column = self.fields[category]

    if column
      case is_active
      when 'true'
        self.where(["#{column} LIKE ? AND members.is_active = ?", "%#{keywords}%", true]).order("#{column} ASC")
      when 'false'
        self.where(["#{column} LIKE ? AND members.is_active = ?", "%#{keywords}%", false]).order("#{column} ASC")
      else
        self.where(["#{column} LIKE ?", "%#{keywords}%"]).order("#{column} ASC")
      end
    else
      Array.new
    end
  end

  # DB fields we can search into for search patterns
  def self.fields
    fields = [ 'last_name', 'organisation','first_name', 'prestations', 'powers', 'city']

    out = Hash.new
    # front label in select => DB column name
    fields.each{|f|out.update("searchable_fields.#{f}" => f)}

    return out
  end

private

  # Compose SQL date from day and month
  def compose_birthday
    begin
      self.birthday = "#{birthday['day']}-#{birthday['month']}-#{birthday['year']}".to_date
    rescue
      self.birthday = nil
    end
  end

end

