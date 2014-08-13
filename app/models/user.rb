class User < ActiveRecord::Base
	Parse.init :application_id => ENV["PARSE_APP_ID"], :api_key => ENV["PARSE_KEY"]

	# Use HTTParty to connect to Parse.com
	include HTTParty
	format :json
	headers['X-Parse-Application-Id'] = ENV["PARSE_APP_ID"]
	headers['X-Parse-REST-API-Key'] = ENV["PARSE_KEY"]
	#headers['X-Parse-Session-Token'] = session[:sessionToken]
	headers["Content-Type"] = "application/json"

	def self.all
		user = Parse::Query.new("_User").exists("objectId").get
	end

	def self.create(user_params)
		user = Parse::User.new({
			:username => user_params["username"],
			:email => user_params["email"],
			:password => user_params["password"]
			})
		user.save
	end

	def self.find_by_objectId(objectId)
		user = Parse::Query.new("_User").eq("objectId", objectId).get
	end

	def self.login(session_params)
		user = Parse::User.authenticate(session_params[:username], session_params[:password])
	end

	def self.get_user(sessionToken)
		user = HTTParty.get('https://api.parse.com/1/users/me')
	end

end
