class EventsController < ApplicationController

  before_filter :is_logged, :load_conf

  # GET /events
  # Show main calendar                                           HTML
  # -----------------------------------------------------------------
  def index
    @calendar = Calendar.find(1)
  end

end

