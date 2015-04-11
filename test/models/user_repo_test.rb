# == Schema Information
#
# Table name: user_repos
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  repo_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class UserRepoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
