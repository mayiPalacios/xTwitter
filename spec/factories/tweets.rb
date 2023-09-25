FactoryBot.define do
  factory :tweet do
    body { Faker::Lorem.sentence }
    user { nil }
    quote { false }
    retweet { false }
  end
end
