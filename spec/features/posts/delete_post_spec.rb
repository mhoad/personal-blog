require 'rails_helper'

RSpec.describe 'Delete Posts', type: :feature do
  let(:category) { FactoryGirl.create(:category) }
  let(:post) { FactoryGirl.create(:post, category: category) }

  context 'As an admin' do
    before do
      login_as(FactoryGirl.create(:admin))
      visit category_post_path(category, post)
    end

    scenario 'can successfully delete posts' do
      click_link 'Delete'

      expect(page).to have_content 'Successfully deleted post!'
      expect(page).to_not have_content post.title
    end
  end

  context 'as a regular user' do
    scenario 'unable to see delete post link' do
      visit category_post_path(category, post)
      expect(page).to_not have_link 'Delete'
    end
  end
end
