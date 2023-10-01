FactoryBot.define do
  factory :follower do
    association :following, factory: :user
    association :followee, factory: :user
  end
end
