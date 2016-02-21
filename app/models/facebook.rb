class Facebook

  def self.authenticate(token)
    begin
      graph = Koala::Facebook::API.new(token)
      user_info = graph.get_object("me")
      random_password = Digest::SHA1.hexdigest([Time.now, rand].join) #pog from hell
      return {name: user_info['name'], email: user_info['email'], facebook_id: user_info['id'], :password=> random_password, :password_confirmation => random_password}
    rescue Koala::Facebook::AuthenticationError => e
      raise Exception.new(e.message)
    end
  end

end
