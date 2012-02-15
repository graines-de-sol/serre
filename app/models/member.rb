class Member < ActiveRecord::Base

  belongs_to :user
  belongs_to :location

  image_accessor :avatar

  before_create :set_birthday_to_now
  before_update :compose_birthday

private

  # Compose SQL date from day and month
  def compose_birthday
    self.birthday = "#{Time.now.year}-#{self.birthday['month']}-#{self.birthday['day']}"
  end

  # Force birthday to now on create
  def set_birthday_to_now
    self.birthday = Time.now
  end

end

