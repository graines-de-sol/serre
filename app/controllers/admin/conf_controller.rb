class Admin::ConfController < ApplicationController

  before_filter :is_admin, :load_conf

  def index
    #
  end

  def create
    if params[:conf]
      conf = Conf.find(1).update_attributes(params[:conf])

      if params[:from]
        redirect_to params[:from]
      else
        redirect_to admin_conf_index_path
      end
    end

    if params[:calendar]
      conf = Calendar.find(1).update_attributes(params[:calendar])

      redirect_to admin_conf_index_path
    end
  end

end

