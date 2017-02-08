require 'rails_helper'

RSpec.describe 'Edit Posts', type: :feature do
  let(:category) { FactoryGirl.create(:category) }
  let(:post) { FactoryGirl.create(:post, category: category) }

  context 'As an admin' do
    before do
      login_as(FactoryGirl.create(:admin))

      visit category_post_path(category, post)
      click_link 'Edit'
    end

    scenario 'create new post with valid attributes' do
      fill_in 'Title', with: 'Non-standards compliance'
      fill_in 'Body', with: 'My pages are ugly!'
      click_button 'Update Post'

      expect(page).to have_content 'Successfully updated post!'
      expect(page).to have_content 'Non-standards compliance'
      expect(page).to have_content 'My pages are ugly!'
    end

    scenario 'with providing invalid attributes' do
      fill_in 'Title', with: ''
      fill_in 'Body', with: ''
      click_button 'Update Post'

      expect(page).to have_content 'Error updating post!'
      expect(page).to have_content "Title can't be blank"
      expect(page).to have_content "Body can't be blank"
    end
  end

  context 'as a regular user' do

    scenario 'unable to see edit post link' do
      visit category_post_path(category, post)
      expect(page).to_not have_link 'Edit'
    end

    scenario 'unable to access the new post pages' do
      visit edit_category_post_path(category, post)

      expect(page.current_path).to eq(category_path(category))
      expect(page).to have_content "You aren't allowed to do that."
    end
  end
end
