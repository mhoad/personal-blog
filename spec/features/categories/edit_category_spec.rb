require 'rails_helper'

RSpec.describe 'Editing categories', type: :feature do
  context 'as an admin' do
    let(:category) { FactoryGirl.create(:category, name: 'Digital Nomad') }

    before do
      login_as(FactoryGirl.create(:admin))
      visit category_path(category)
      click_link 'Edit Category'
    end

    scenario 'with valid attributes' do
      fill_in 'Name', with: 'New Category'
      fill_in 'Description', with: 'New category description'
      click_button 'Update Category'

      expect(page).to have_content('Successfully updated category!')
      expect(page).to have_content('New Category')
      expect(page).to have_content('New category description')
    end

    scenario 'with invalid attributes' do
      fill_in 'Name', with: ''
      click_button 'Update Category'

      expect(page).to have_content('Error updating category!')
      expect(page).to have_content("Name can't be blank")
    end
  end

  context 'as a regular user' do
    let(:category) { FactoryGirl.create(:category, name: 'Digital Nomad') }

    scenario 'unable to see edit link' do
      visit category_path(category)

      expect(page).to_not have_link 'Edit Category'
    end

    scenario 'unable to visit edit page' do
      visit edit_category_path(category)

      expect(page.current_path).to eq(root_path)
      expect(page).to have_content "You aren't allowed to do that."
    end
  end
end
