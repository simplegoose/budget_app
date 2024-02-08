FactoryBot.define do
  factory :category do
    name { 'MyString' }
    icon { 'MyString' }
    association :user
  end
end
