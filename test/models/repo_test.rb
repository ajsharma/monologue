# == Schema Information
#
# Table name: repos
#
#  id          :integer          not null, primary key
#  provider_id :integer
#  name        :string(255)
#  full_name   :string(255)
#  description :string(255)
#  private     :boolean
#  fork        :boolean
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class RepoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
