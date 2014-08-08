class WelcomeController < ApplicationController
  before_filter :authorize

  def index
    @events = Event.all
  end
end
