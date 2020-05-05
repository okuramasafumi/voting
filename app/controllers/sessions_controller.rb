class SessionsController < ApplicationController
  def new
  end

  def create
    authentication = Authentication.find_or_create_from_auth_hash(auth_hash)
    user = authentication.user
    cookies.signed[:user_id] = user.id
    redirect_to root_url
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
