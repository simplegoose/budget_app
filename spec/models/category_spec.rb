require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { create(:user) }
  let(:category) { create(:category, user: user) }

  it 'is valid with valid attributes' do
    expect(category).to be_valid
  end

  it 'belongs to a user' do
    association = Category.reflect_on_association(:user)
    expect(association.macro).to eq(:belongs_to)
  end
end
