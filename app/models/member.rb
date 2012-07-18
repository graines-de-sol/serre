class Member < ActiveRecord::Base

  belongs_to :location
  belongs_to :status
  belongs_to :user

  has_many :ads
  has_many :networks, :through=>:profiles
  has_many :profiles
  has_many :comments

  validates_presence_of :first_name
  before_update :compose_birthday

  image_accessor :avatar

  normalize_attributes :website, :baseline, :organisation, :prestations, :references, :city, :hobbies, :powers
  normalize_attribute :phone, :with=>:phone

  acts_as_birthday :birthday

  # Weither a user can edit or just view a given content
  def self.can_edit?(current_user, current_id)
    ((current_user.role == 'admin' && !current_user.view_as_user)|| current_id == current_user.member.id)? true : false
  end

  # Search member by column and keywords
  def self.search_by(category, keywords)
    column = self.fields[category]

    if column
      self.where(["#{column} LIKE ?", "%#{keywords}%"]).order("#{column} ASC")
    else
      Array.new
    end
  end

  # DB fields we can search into for search patterns
  def self.fields
    fields = ['first_name', 'last_name', 'prestations', 'powers', 'organisation']

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

