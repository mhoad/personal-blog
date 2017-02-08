require 'rails_helper'

RSpec.describe 'New Posts', type: :feature do
  context 'As an admin' do
    before do
      login_as(FactoryGirl.create(:admin))
      category = FactoryGirl.create(:category, name: 'Digital Nomad')
      visit category_path(category)
      click_link 'New Post'
    end

    scenario 'create new post with valid attributes' do
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

  context 'as a regular user' do
    let(:category) { FactoryGirl.create(:category, name: 'Digital Nomad') }

    before do
      visit category_path(category)
    end

    scenario 'unable to see new post button' do
      expect(page).to_not have_button 'Create Post'
    end

    scenario 'unable to access the new post pages' do
      visit new_category_post_path(category)

      expect(page.current_path).to eq(category_path(category))
      expect(page).to have_content "You aren't allowed to do that."
    end
  end
end
