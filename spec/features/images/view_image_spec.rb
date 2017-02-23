require 'rails_helper'

RSpec.describe 'Viewing categories', type: :feature do
  context 'as a regular user' do
    let(:image) { FactoryGirl.create(:image) }

    scenario 'can not view internal image path' do
      visit image_path(image)

      expect(page.current_path).to eq(root_path)
      expect(page).to have_content "You aren't allowed to do that."
    end
  end

  context 'as an admin' do
    let(:image) { FactoryGirl.create(:image) }

    before do
      login_as(FactoryGirl.create(:admin))
    end

    scenario 'shows the correct information on the page' do
      visit image_path(image)

      expect(page).to have_content image.title
      expect(page).to have_content image.caption
    end
  end
end
