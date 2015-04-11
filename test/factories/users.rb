# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  provider   :string(255)
#  uid        :string(255)
#  created_at :datetime
#  updated_at :datetime
#  role       :integer
#

FactoryGirl.define do

  factory :user do
    role :user

    trait :with_repos do
      after :create do |user|
        user.repos << FactoryGirl.create_list( :repo, 5 )
      end
    end
  end

end
