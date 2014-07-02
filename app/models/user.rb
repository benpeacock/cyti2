class User < ActiveRecord::Base
	Parse.init :application_id => ENV["PARSE_APP_ID"], :api_key => ENV["PARSE_KEY"]

	def self.create(user_params)
		user = Parse::User.new({
			:username => user_params["username"],
			:email => user_params["email"],
			:password => user_params["password"]
			})
		user.save
	end
end
