require 'rails_helper'

RSpec.describe 'Admins can delete categories', type: :feature do
  before do
    login_as(FactoryGirl.create(:admin))
  end

  scenario 'successfully' do
    FactoryGirl.create(:category, name: 'Example Category')

    visit categories_path
    click_link 'Example Category'
    click_link 'Delete Category'

    expect(page).to have_content 'Successfully deleted category!'
    expect(page.current_url).to eq categories_url
    expect(page).to have_no_content 'Example Category'
  end
end
