require 'rails_helper'

RSpec.describe 'Admin Sign Out', type: :feature do
  context 'As an admin' do
    before do
      login_as(FactoryGirl.create(:admin))
      visit '/'
    end

    scenario 'Admin can sign out using link provided' do
      click_link 'Logout'
      expect(page).to have_content('Signed out successfully.')
    end
  end

  context 'as a regular user' do
    scenario 'No option to sign out if not logged in' do
      visit '/'
      expect(page).to_not have_link('Logout')
    end
  end
end
