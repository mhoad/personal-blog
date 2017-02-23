require 'rails_helper'

RSpec.describe 'Admins can delete images', type: :feature do
  before do
    login_as(FactoryGirl.create(:admin))
  end

  let(:image) { FactoryGirl.create(:image, title: 'Example Image') }

  scenario 'successfully' do
    visit image_path(image)
    click_link 'Delete Image'

    expect(page).to have_content 'Successfully deleted image.'
    expect(page.current_url).to eq images_url
    expect(page).to have_no_content 'Example Image'
  end
end
