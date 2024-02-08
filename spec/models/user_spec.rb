require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = build(:user)
    expect(user).to be_valid
  end

  it 'is not valid without valid attributes' do
    food_inventory = build(:user, name: nil, photo: nil)
    expect(food_inventory).to_not be_valid
  end
end
