class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def authorize
    redirect_to login_url, alert: "Not logged in" if session[:sessionToken].nil?
  end

end
