require 'rails_helper'

RSpec.describe 'Posts', type: :model do
  it 'has a valid factory' do
    expect(build(:post)).to be_valid
  end

  let(:post) { build(:post) }

  describe 'ActiveModel validations' do
    it { expect(post).to validate_presence_of(:title) }
    it { expect(post).to validate_presence_of(:body) }
  end

  describe 'ActiveModel Associations' do
    it { expect(post).to belong_to(:category) }
  end
end
