require 'rails_helper'

RSpec.describe 'View Post', type: :feature do
  let(:category) { FactoryGirl.create(:category) }
  let(:post) { FactoryGirl.create(:post, category: category) }

  scenario 'post shows the correct information' do
    visit category_post_path(category, post)

    expect(page).to have_content post.title
    expect(page).to have_content post.body
  end
end
