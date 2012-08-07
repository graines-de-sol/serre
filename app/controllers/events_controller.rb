class EventsController < ApplicationController

  before_filter :is_logged, :load_conf

  # GET /events
  # Show main calendar                                           HTML
  # -----------------------------------------------------------------
  def index
    @calendar = Calendar.find(1)
  end

  # POST /events
  # Send registration via EMail                                  AJAX
  # -----------------------------------------------------------------
  def create
    @calendar = Calendar.find(params[:calendar_id])

    Notifier.event_registration({
      :to   => @calendar.email,
      :current_user => current_user,
      :body => {
        :event_name => params[:event_name],
        :event_date => params[:event_date]}
      }
    ).deliver

    render :text => params[:user_id]
  end

end

