require 'rails_helper'

RSpec.describe 'Categories', type: :model do
  it 'has a valid factory' do
    expect(build(:category)).to be_valid
  end

  let(:category) { build(:category) }

  describe 'ActiveModel validations' do
    it { expect(category).to validate_presence_of(:name) }
    it { expect(category).to validate_presence_of(:description) }
  end

  describe 'ActiveModel Associations' do
    it { expect(category).to have_many(:posts) }
  end
end
