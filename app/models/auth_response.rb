class AuthResponse < ActiveRecord::Base

  serialize :raw

  belongs_to :user

  def github_access_token
    @github_access_token ||= raw.credentials.token
  end

  def github_username
    @github_username ||= raw.info.nickname
  end

end
