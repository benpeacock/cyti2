class Event < ActiveRecord::Base

  # Use HTTParty to conenct to Parse.com
  include HTTParty
  format :json
  headers['X-Parse-Application-Id'] = ENV["PARSE_APP_ID"]
  headers['X-Parse-REST-API-Key'] = ENV["PARSE_KEY"]
  # headers["Content-Type"] = "application/json"

  Parse.init :application_id => ENV["PARSE_APP_ID"], :api_key => ENV["PARSE_KEY"]

  def self.all
  	get("https://api.parse.com/1/classes/Event")
  end

  def self.find_by_objectId(id)
  	JSON.parse(get(URI.escape("https://api.parse.com/1/classes/Event/#{id}")).body)
  end

  def self.update(event_params)
    event = Parse::Query.new("Event").eq("objectId", "kknBHqfwUo").get.first
    event["address"] = event_params[:address]
    event["endDate"] = event_params[:endDate]
    event["imageThumbUrl"] = event_params[:imageThumbUrl]
    event["moreInfo"] = event_params[:moreInfo]
    event["shortDescription"] = event_params[:shortDescription]
    event["title"] = event_params[:title]
    event.save
  end

end 
