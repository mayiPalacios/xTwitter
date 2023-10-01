FactoryBot.define do
  factory :tag do
    user { association :user } 
    hashtag {association :hashtag}
  end
end
