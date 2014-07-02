class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.login(session_params)
  	if @user
  		#session[:user_id] = user.id
  		redirect_to root_url, notice: "Logged in"
  	else
  		flash.now.alert = "Email or password is invalid"
  		render "new"
  	end
  end

  private

  def session_params
      params.permit(:username, :password)
    end
end
