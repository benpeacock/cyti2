class Event < ActiveRecord::Base

  # Use HTTParty to conenct to Parse.com
  include HTTParty
  headers['X-Parse-Application-Id'] = ENV["PARSE_APP_ID"]
  headers['X-Parse-REST-API-Key'] = ENV["PARSE_KEY"]
  # headers["Content-Type"] = "application/json"

  def self.find_by_objectId(objectId)
  	get(URI.escape("https://api.parse.com/1/classes/Event/#{objectId}"))
  end
  
 # def self.find_by_title(title)
  # 	get(URI.escape("https://api.parse.com/1/classes/Event/#{title}"))
  # end
 

  # def self.find_by_objectId(objectId)
  # 	get('https://api.parse.com/1/classes/Event/', :query => { :objectId => objectId })
  # end
end 
