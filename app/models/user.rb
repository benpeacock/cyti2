class User < ActiveRecord::Base
	Parse.init :application_id => ENV["PARSE_APP_ID"], :api_key => ENV["PARSE_KEY"]

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

	def self.login(user_params)
		user = Parse::User.authenticate(user_params[:username], user_params[:password])
	end

end
