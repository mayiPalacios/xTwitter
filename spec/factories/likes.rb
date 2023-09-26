FactoryBot.define do
  factory :like do
    user { association :user } 
    tweet {association :tweet}
  end
end
