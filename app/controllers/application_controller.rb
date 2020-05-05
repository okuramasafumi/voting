class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find_by(id: cookies.signed[:user_id])
  end
  helper_method :current_user

  def authenticate!
    current_user || redirect_to(root_url)
  end
end
