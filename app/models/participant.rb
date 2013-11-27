class Participant < ActiveRecord::Base

  belongs_to :event
  belongs_to :member
  after_create :notify_registration
  after_destroy :notify_cancelation

  def notify_registration

    Notifier.event_admin_registration({
      :to   => self.event.calendar.email,
      :current_user => self.member.user,
      :body => {
        :event_name => self.event.title,
        :event_date => I18n.l(self.event.start_at, :format => :long)
      }
    }).deliver

    Notifier.event_registration({
      :to   => self.member.user.email,
      :current_user => self.member.user,
      :body => {
        :event_name => self.event.title,
        :event_date => I18n.l(self.event.start_at, :format => :long)
      }
    }).deliver
  end

  def notify_cancelation

    Notifier.event_admin_cancelation({
      :to   => self.event.calendar.email,
      :current_user => self.member.user,
      :body => {
        :event_name => self.event.title,
        :event_date => I18n.l(self.event.start_at, :format => :long)
      }
    }).deliver
    
    Notifier.event_cancelation({
      :to   => self.member.user.email,
      :current_user => self.member.user,
      :body => {
        :event_name => self.event.title,
        :event_date => I18n.l(self.event.start_at, :format => :long)
      }
    }).deliver
  end

end

