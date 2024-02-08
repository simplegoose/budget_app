require 'rails_helper'

RSpec.feature 'Entities', type: :feature do
  let(:user) { create(:user) }
  let(:category) { create(:category, icon: 'new.jpg') }

  before do
    login_as(user, scope: :user)
  end

  scenario 'User creates a new transaction' do
    visit new_category_entity_path(category)


    fill_in 'entity_name', with: 'Name'
    fill_in 'entity_amount', with: 15

    click_button 'Save'

    expect(page).to have_content('Name')
    expect(page).to have_content(15)
  end
end
