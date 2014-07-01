class Event < ActiveRecord::Base

  # Use HTTParty to conenct to Parse.com
  include HTTParty
  format :json
  headers['X-Parse-Application-Id'] = ENV["PARSE_APP_ID"]
  headers['X-Parse-REST-API-Key'] = ENV["PARSE_KEY"]
  # headers["Content-Type"] = "application/json"

  Parse.init :application_id => ENV["PARSE_APP_ID"], :api_key => ENV["PARSE_KEY"]

  def self.all
    event = Parse::Query.new("Event").exists("objectId").get
  end

  # Returns an array
  def self.find_by_objectId(objectId)
    event = Parse::Query.new("Event").eq("objectId", objectId).get
  end

  def self.update(event_params)
    event = Parse::Query.new("Event").eq("objectId", event_params[:objectId]).get.first
    event["address"] = event_params[:address]
    event["endDate"] = event_params[:endDate]
    event["imageThumbUrl"] = event_params[:imageThumbUrl]
    event["moreInfo"] = event_params[:moreInfo]
    event["shortDescription"] = event_params[:shortDescription]
    event["title"] = event_params[:title]
    event.save
  end

    def self.create(event_params)
    event = Parse::Object.new("Event")
    event["address"] = event_params[:address]
    event["endDate"] = event_params[:endDate]
    event["imageThumbUrl"] = event_params[:imageThumbUrl]
    event["moreInfo"] = event_params[:moreInfo]
    event["shortDescription"] = event_params[:shortDescription]
    event["title"] = event_params[:title]
    event.save
  end

  def self.destroy(objectId)
    event = Parse::Query.new("Event").eq("objectId", objectId).get.first
    event.parse_delete
  end

end 
