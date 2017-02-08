require 'rails_helper'

RSpec.describe 'Viewing categories', type: :feature do
  let(:category) { FactoryGirl.create(:category) }

  scenario 'shows the correct information on the page' do
    visit category_path(category)

    expect(page).to have_content category.name
    expect(page).to have_content category.description
  end
end
