require 'rails_helper'

RSpec.describe 'Admins can delete categories', type: :feature do
  context 'As an admin' do
    let(:category) { FactoryGirl.create(:category, name: 'Digital Nomad') }

    before do
      login_as(FactoryGirl.create(:admin))
    end

    scenario 'successfully' do
      visit category_path(category)

      click_link 'Edit Category'
      fill_in 'Name', with: 'New Category'
      fill_in 'Description', with: 'New category description'
      click_button 'Update Category'

      expect(page).to have_content('Successfully updated category!')
      expect(page).to have_content('New Category')
      expect(page).to have_content('New category description')
    end
  end
end
