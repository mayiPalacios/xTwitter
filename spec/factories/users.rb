FactoryBot.define do
  factory :user do
    name { Faker::Name.name.first_name  }
    follower_number { 1 }
    following_number { 1 }
    email {""}
    password {"pro"}
    username {""}
    lastname {Faker::Name.last_name}
  end
end
