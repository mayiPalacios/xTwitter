FactoryBot.define do
  factory :replie do
    id {1}
    reply_text { Faker::Lorem.sentence }
    association :user 
    association :tweet 
  end
end
