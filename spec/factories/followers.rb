FactoryBot.define do
  factory :follower do
    follower_user { nil }
    following_user { nil }
  end
end
