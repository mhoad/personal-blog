require 'rails_helper'

RSpec.describe 'Editing Images', type: :feature do
  context 'as an admin' do
    let(:image) { FactoryGirl.create(:image) }

    before do
      login_as(FactoryGirl.create(:admin))
      visit image_path(image)
      click_link 'Edit Image'
    end

    scenario 'with valid attributes' do
      fill_in 'Title', with: 'New Image Title'
      fill_in 'Caption', with: 'New Image Description'
      click_button 'Update Image'

      expect(page).to have_content('Successfully updated image')
      expect(page).to have_content('New Image Title')
      expect(page).to have_content('New Image Description')
    end

    scenario 'with invalid attributes' do
      fill_in 'Title', with: ''
      click_button 'Update Image'

      expect(page).to have_content('Error updating image')
      expect(page).to have_content("Title can't be blank")
    end
  end

  context 'as a regular user' do
    let(:image) { FactoryGirl.create(:image) }

    scenario 'unable to see edit link' do
      visit image_path(image)

      expect(page.current_path).to eq(root_path)
      expect(page).to have_content "You aren't allowed to do that."
    end

    scenario 'unable to visit edit page' do
      visit edit_image_path(image)

      expect(page.current_path).to eq(root_path)
      expect(page).to have_content "You aren't allowed to do that."
    end
  end
end
