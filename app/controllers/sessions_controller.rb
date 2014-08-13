class SessionsController < ApplicationController

  include HTTParty
  format :json
  headers['X-Parse-Application-Id'] = ENV["PARSE_APP_ID"]
  headers['X-Parse-REST-API-Key'] = ENV["PARSE_KEY"]
  headers['X-Parse-Session-Token'] = session[:sessionToken]
  headers["Content-Type"] = "application/json"

  def new
  end

  def create
  	@user = User.login(session_params)
  	if @user
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

#def get_user(sessionToken)
  #  @user = HTTParty.get('https://api.parse.com/1/users/me')
#  end

  def session_params
      params.permit(:username, :password)
  end
end
