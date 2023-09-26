FactoryBot.define do
  factory :tweet do
    body { Faker::Lorem.sentence }
    user { association :user } 
    quote { false }
    retweet { false }
  end
end
