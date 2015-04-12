class SessionsController < ApplicationController

  def new
    redirect_to '/auth/github'
  end

  def create
    auth = request.env["omniauth.auth"]

    user = User.find_or_create_with_omniauth auth
    user.auth_responses.create! provider: auth['provider'], raw: auth

    self.current_user = user

    redirect_to root_url, notice: 'Signed in!'
  end

  def destroy
    reset_session
    redirect_to root_url, notice: 'Signed out!'
  end

  def failure
    redirect_to root_url, alert: "Authentication error: #{params[:message].humanize}"
  end

end
