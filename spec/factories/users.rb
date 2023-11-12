FactoryBot.define do
  factory :user do
    name { Faker::Name.name  }
    follower_number { Faker::Number.number(digits: 2)}
    following_number { Faker::Number.number(digits: 2) }
    email {Faker::Internet.email}
    password {"Maria@1234_jjj"}
    password_confirmation {"Maria@1234_jjj"}
    username {Faker::Internet.username }
    lastname {Faker::Name.last_name}
  end
end
