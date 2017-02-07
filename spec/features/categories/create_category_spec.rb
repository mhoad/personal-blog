require 'rails_helper'

RSpec.describe 'Create Category', type: :feature do
  before do
    login_as(FactoryGirl.create(:admin))
    visit new_category_path
  end

  scenario 'with valid attributes' do
    fill_in 'Name', with: 'Example Category'
    fill_in 'Description', with: 'Example category description'
    click_button 'Create Category'

    expect(page).to have_content('Successfully created category!')
    expect(page).to have_content('Example Category')
    expect(page).to have_content('Example category description')

    category = Category.find_by(name: 'Example Category')
    expect(page.current_url).to eq category_url(category)
  end

  scenario 'when providing invalid attributes' do
    click_button 'Create Category'

    expect(page).to have_content('Error creating new category!')
    expect(page).to have_content("Name can't be blank")
  end
end
