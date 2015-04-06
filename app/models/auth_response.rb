# == Schema Information
#
# Table name: auth_responses
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  provider   :string(255)
#  raw        :text
#  created_at :datetime
#  updated_at :datetime
#

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
