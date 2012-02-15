class DashboardController < ApplicationController

  before_filter :is_logged

  def index
    #raise params[:controller].inspect
  end

end

