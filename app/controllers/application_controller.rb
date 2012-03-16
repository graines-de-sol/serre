class ApplicationController < ActionController::Base
  protect_from_forgery

  # Check we're admin
  def is_logged
    redirect_to '/users/sign_in' unless user_signed_in?
  end

  # Load global conf
  def load_conf
    $conf = Conf.find(1)
  end

end

