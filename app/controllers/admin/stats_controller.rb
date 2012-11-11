class Admin::StatsController < ApplicationController

  before_filter :is_admin, :load_conf

  # GET /admin/conf
  # Show global conf params                                HTML
  # ----------------------------------------------------------
  def index

  	params[:dir] == "asc" ? dir = "ASC" : dir = "DESC"

    case params[:sort]
    when 'name'
      @users = User.includes(:member).order("members.last_name #{dir}").all
    when 'cx'
      @users = User.order("sign_in_count #{dir}").all
    else
      @users = User.order("last_sign_in_at #{dir}").all
    end
  end

end

