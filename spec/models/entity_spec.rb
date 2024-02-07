require 'rails_helper'

RSpec.describe Entity, type: :model do
  let(:user) { create(:user) }
  let(:category) { create(:category, user: user) }
  let(:entity) { create(:entity, author: user, category: category) }

  it 'is valid with valid attributes' do
    expect(entity).to be_valid
  end

  it 'belongs to a category' do
    association = Entity.reflect_on_association(:category)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'belongs to a user' do
    association = Entity.reflect_on_association(:author)
    expect(association.macro).to eq(:belongs_to)
  end
end
