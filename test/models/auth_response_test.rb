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

require 'test_helper'

class AuthResponseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
