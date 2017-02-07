require 'rails_helper'

RSpec.describe 'Admin Sign In', type: :feature do
  let(:admin) { FactoryGirl.create(:admin) }

  before do
    visit '/admins/sign_in'
  end

  scenario 'User provides valid credentials' do
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully.')
  end
end
