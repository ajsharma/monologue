class User < ActiveRecord::Base

  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  has_many :auth_responses

  def auth_response
    @auth_response ||= auth_responses.last
  end

  def github_access_token
    auth_response.github_access_token
  end

  def github_username
    auth_response.github_username
  end

  def set_default_role
    if User.count == 0
      self.role ||= :admin
    else
      self.role ||= :user
    end
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
      end
    end
  end

end
