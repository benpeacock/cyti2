class Event < ActiveRecord::Base

  # Use HTTParty to conenct to Parse.com
  include HTTParty
  headers['X-Parse-Application-Id'] = ENV["PARSE_APP_ID"]
  headers['X-Parse-REST-API-Key'] = ENV["PARSE_KEY"]
  # headers["Content-Type"] = "application/json"

  def self.find_by_id(id)
  	get('https://api.parse.com/1/classes/event', :query => { :id => id })
  end

end 
