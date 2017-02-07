require 'rails_helper'

RSpec.describe 'Admins can create new posts', type: :feature do
  let(:admin) { FactoryGirl.create(:admin) }
  before do
    login_as(admin)
    category = FactoryGirl.create(:category, name: 'Digital Nomad')

    visit category_path(category)
    click_link 'New Post'
  end

  scenario 'with valid attributes' do
    fill_in 'Title', with: 'Non-standards compliance'
    fill_in 'Body', with: 'My pages are ugly!'
    click_button 'Create Post'

    expect(page).to have_content 'Successfully created post!'
    expect(page).to have_content 'Non-standards compliance'
    expect(page).to have_content 'My pages are ugly!'
  end

  scenario 'with providing invalid attributes' do
    click_button 'Create Post'

    expect(page).to have_content 'Error creating new post!'
    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Body can't be blank"
  end
end
