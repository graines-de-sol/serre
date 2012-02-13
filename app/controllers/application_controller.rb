class ApplicationController < ActionController::Base
  protect_from_forgery

  # Check we're admin
  def is_admin
    redirect_to '/users/sign_in' unless user_signed_in?
  end

end

