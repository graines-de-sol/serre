class UsersController < ApplicationController

  before_filter :is_logged, :load_conf

  def update
    user = User.find(params[:id])
    if user.update_attributes(params[:user])
      sign_in(user, :bypass => true)

      render :json => 'success'.to_json, :status => 200
    else
      render :json => user.errors.to_json, :status => 422
    end    
  end

end

