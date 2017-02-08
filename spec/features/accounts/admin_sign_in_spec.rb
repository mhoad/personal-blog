require 'rails_helper'

RSpec.describe 'Admin Sign In', type: :feature do
  let(:admin) { FactoryGirl.create(:admin) }

  before do
    visit '/admins/sign_in'
  end

  scenario 'User provides valid credentials' do
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign in'
    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'Invalid credentials are rejected' do
    fill_in 'Email', with: 'admin@example.com'
    fill_in 'Password', with: 'guessed_your_password'
    click_button 'Sign in'
    expect(page).to_not have_content('Signed in successfully.')
    expect(page).to have_content('Invalid Email or password.')
    expect(page.current_path).to eq '/admins/sign_in'
  end
end
