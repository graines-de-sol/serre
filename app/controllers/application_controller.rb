class ApplicationController < ActionController::Base
  protect_from_forgery

  # Check we're logged
  def is_logged
    redirect_to '/users/sign_in' unless user_signed_in?
  end

  # Check we're admin
  def is_admin
    redirect_to '/' unless (current_user.role == 'admin' && !current_user.view_as_user)
  end

  # Load global conf
  def load_conf
    $conf = Conf.find(1)
  end

end

