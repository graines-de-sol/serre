class Admin::ConfController < ApplicationController

  before_filter :is_admin, :load_conf

  # GET /admin/conf
  # Show global conf params                                HTML
  # ----------------------------------------------------------
  def index
    #
  end

  # POST /admin/conf
  # Update global conf params                          REDIRECT
  # -----------------------------------------------------------
  def create
    # !!!FIXME : there should be a way to init TinyMCE with proper params to avoid this crap
    params[:conf][:welcome_mail_body] = params[:article][:content] if params[:article]

    conf = Conf.find(1).update_attributes(params[:conf])

    params[:from] ? redirect_to params[:from] : redirect_to admin_conf_index_path
  end

end

