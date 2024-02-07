require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  let(:user) { create(:user) }

  before do
    login_as(user, scope: :user)
  end

  scenario 'User creates a new category' do
    visit new_category_path

    fill_in 'category_name', with: 'Name'
    fill_in 'category_icon', with: 'new.jpg'

    click_button 'Save'

    expect(page).to have_content('Name')
  end
end
