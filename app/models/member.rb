class Member < ActiveRecord::Base

  belongs_to :user
  belongs_to :location
  belongs_to :status
  has_many :profiles
  has_many :networks, :through=>:profiles

  validates_presence_of :first_name

  image_accessor :avatar

  before_create :set_birthday_to_now
  before_update :compose_birthday


  def self.can_edit?(user_role, current_user)
    (user_role == 'admin' || self.id == current_user)? true : false
  end

  def age
    now = Time.now.year - self.birthday.year
  end

  def http_website
    "http://#{self.website}"
  end

private

  # Compose SQL date from day and month
  def compose_birthday
    self.birthday['day'] = 1 if (self.birthday['day'].strip.blank? || self.birthday['day'].to_i == 0)
    self.birthday = "#{self.birthday['year']}-#{self.birthday['month']}-#{self.birthday['day']}"
  end

  # Force birthday to now on create
  def set_birthday_to_now
    self.birthday = Time.now
  end


end

