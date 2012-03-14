class DashboardController < ApplicationController

  before_filter :is_logged

  def index
    @new_ones = User.order('created_at DESC').limit(6).includes(:member)
    @temp = User.find(38)
  end

end

