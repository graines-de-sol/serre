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
    #@calendar = Calendar.find(1)
    sleep(5)
    render :text => params[:user_id]
  end

end

