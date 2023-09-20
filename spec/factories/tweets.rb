FactoryBot.define do
  factory :tweet do
    body { "MyText" }
    user { nil }
    likes { nil }
    quote { false }
    retweet { false }
  end
end
