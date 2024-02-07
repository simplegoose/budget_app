FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    name { Faker::Lorem.word }
    photo { Faker::Lorem.word }
  end
end
