class Event < ActiveRecord::Base

  # Use HTTParty to conenct to Parse.com
  include HTTParty
  format :json
  headers['X-Parse-Application-Id'] = ENV["PARSE_APP_ID"]
  headers['X-Parse-REST-API-Key'] = ENV["PARSE_KEY"]
  # headers["Content-Type"] = "application/json"

  def initialize(address)
  	self.id = id
    self.address = address
    # include other attributes if this works
  end

  def self.all
  	get("https://api.parse.com/1/classes/Event")
  end

  def self.find_by_objectId(id)
  	JSON.parse(get(URI.escape("https://api.parse.com/1/classes/Event/#{id}")).body)
  end

end 
