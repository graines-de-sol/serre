class Member < ActiveRecord::Base

  belongs_to :user
  belongs_to :location

  validates_presence_of :first_name

  image_accessor :avatar

  before_create :set_birthday_to_now
  before_update :force_day_of_birth, :compose_birthday


private

  # Compose SQL date from day and month
  def compose_birthday
    self.birthday = "#{Time.now.year}-#{self.birthday['month']}-#{self.birthday['day']}"
  end

  # Force birthday to now on create
  def set_birthday_to_now
    self.birthday = Time.now
  end

  # Force birthday to first day of month is not filled in
  def force_day_of_birth
    self.birthday['day'] = 1 if self.birthday['day'].strip.blank?
  end

end

