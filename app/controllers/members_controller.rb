class MembersController < ApplicationController

  before_filter :is_admin

  def index
    #raise params[:controller].inspect
  end

end

