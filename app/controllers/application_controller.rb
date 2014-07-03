class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  # check for session[:sessionToken] in views
  def current_user
  	@current_user ||= User.find(session[:sessionToken]) if session[:sessionToken]
  end
  # make current_user method accessible in views
  helper_method :current_user
end
