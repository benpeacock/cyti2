class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Use HTTParty to conenct to Parse.com
  include HTTParty
  format :json
  headers['X-Parse-Application-Id'] = ENV["PARSE_APP_ID"]
  headers['X-Parse-REST-API-Key'] = ENV["PARSE_KEY"]
  headers['X-Parse-Session-Token'] = "session[:sessionToken]"
  headers["Content-Type"] = "application/json"

  private

  def authorize
    redirect_to login_url, alert: "Not logged in" if session[:sessionToken].nil?
  end

end
