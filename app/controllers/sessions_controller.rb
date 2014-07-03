class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.login(session_params)
  	if @user
  		puts 'shazam'
  		puts @user["username"]
  		puts @user["sessionToken"]
  		puts @user["objectId"]
  		session[:sessionToken] = @user["sessionToken"]
  		redirect_to root_url, notice: "Logged in"
  	else
  		flash.now.alert = "Email or password is invalid"
  		render "new"
  	end
  end

  def destroy
  	session[:sessionToken] = nil
  	reset_session
  	redirect_to root_url, notice: "Logged out."
  end

  private

  def session_params
      params.permit(:username, :password)
    end
end
