json.array!(@users) do |user|
  json.extract! user, :id, :username, :password, :emailVerified, :email, :zipcode
  json.url user_url(user, format: :json)
end
