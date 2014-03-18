class SessionsController < ApplicationController
  def new
  end

  def create
	user = User.find(name: params[:name])
	if user and user.authenticate(params[:passwors])
		session[:user_is] = user_id
		redirect_to admin_url
	else
		redirect_to login_url, alert: "Invalid user/password combination"
	end
  end

  def destroy
	session[:user_id] = nil
	redirect_to store_url, notice: "Logged out"
  end
end
