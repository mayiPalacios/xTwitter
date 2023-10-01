FactoryBot.define do
  factory :hashtag do
    hashtag_name { Faker::Lorem.word } 
    body { Faker::Lorem.sentence } 
  end
end
