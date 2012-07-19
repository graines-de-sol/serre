class Admin::HeadlinesController < ApplicationController

  before_filter :is_admin, :load_conf

  # POST /admin/headlines
  # Update headline                                    REDIRECT
  # -----------------------------------------------------------
  def create
    Conf.find($conf.id).update_attributes(params[:conf])

    redirect_to admin_headlines_path
  end

end

