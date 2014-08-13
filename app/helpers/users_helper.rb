module UsersHelper
  def self.get_user(sessionToken)
    user = HTTParty.get('https://api.parse.com/1/users/me')
  end
end
