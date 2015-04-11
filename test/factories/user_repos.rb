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

FactoryGirl.define do

  factory :user_repo do
    user user
    repo repo
  end

end
