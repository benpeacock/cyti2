class Event < ActiveRecord::Base

  # Use HTTParty to conenct to Parse.com
  include HTTParty
  format :json
  headers['X-Parse-Application-Id'] = ENV["PARSE_APP_ID"]
  headers['X-Parse-REST-API-Key'] = ENV["PARSE_KEY"]
  # headers["Content-Type"] = "application/json"

  #Parse.init :application_id => ENV["PARSE_APP_ID"], :api_key => ENV["PARSE_KEY"]

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

  def self.update(event_params)
    puts 'hello from update method in model'
    Parse.init :application_id => ENV["PARSE_APP_ID"], :api_key => ENV["PARSE_KEY"]
    event = Parse::Query.new("Event").eq("objectId", "kknBHqfwUo").get.first
    event["address"] = "An even more updated address"
    result = event.save
    puts result
  end

  # def self.update(event_params)
  #   @objectId = event_params["objectId"]
  #   post("https://api.parse.com/1/classes/Event/#{@objectId}", :body => {:address => 'updated address'}.to_json, :headers => { 'Content-Type' => 'application/json' })
  # end

end 
