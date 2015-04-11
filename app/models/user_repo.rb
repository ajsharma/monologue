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

class UserRepo < ActiveRecord::Base
  belongs_to :repo
  belongs_to :user
end
