require 'rails_helper'

RSpec.describe 'Upload Image', type: :feature do
  context 'as an admin' do
    before do
      login_as(FactoryGirl.create(:admin))
      visit new_image_path
    end

    scenario 'with valid attributes' do
      fill_in 'Title', with: 'Example Image Title'
      fill_in 'Caption', with: 'Example Image description'
      fill_in 'Licence', with: 'https://creativecommons.org/publicdomain/zero/1.0/'
      fill_in 'Geo location', with: 'Sydney, Australia'
      attach_file('image_image', Rails.root + 'spec/support/images/ab-test-results.png')
      click_button 'Create Image'

      expect(page).to have_content('Successfully uploaded image')
      expect(page).to have_content('Example Image Title')

      image = Image.find_by(title: 'Example Image Title')
      expect(page.current_url).to eq image_url(image)
    end

    scenario 'when providing invalid attributes' do
      click_button 'Create Image'

      expect(page).to have_content('Error uploading image.')
      expect(page).to have_content("Title can't be blank")
      expect(page).to have_content("Image can't be blank")
    end
  end

  context 'as a regular user' do
    scenario 'unable to access the create category page' do
      visit new_image_path
      expect(page.current_path).to eq(root_path)
      expect(page).to have_content "You aren't allowed to do that."
    end
  end
end
