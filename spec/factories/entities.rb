FactoryBot.define do
  factory :entity do
    association :author, factory: :user
    name { 'MyString' }
    amount { 1 }
    association :category
  end
end
