FactoryBot.define do
  factory :user do
    name { "MyString" }
    follower_number { 1 }
    following_number { 1 }
  end
end
