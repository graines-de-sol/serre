class ApplicationController < ActionController::Base
  protect_from_forgery

  def is_admin
    redirect_to '/users/sign_in' unless user_signed_in?
  end

end

