FactoryBot.define do
  factory :reply do
    body { Faker::Lorem.sentence }
    user { association :user } 
    tweet {association :tweet}
  end
end
