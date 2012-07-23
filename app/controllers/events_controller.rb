class EventsController < ApplicationController

  before_filter :is_logged, :load_conf

  # GET /events
  # Show main calendar                                           HTML
  # -----------------------------------------------------------------
  def index

  end

end

