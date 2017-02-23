require 'rails_helper'

RSpec.describe 'Images', type: :model do
  it 'has a valid factory' do
    expect(build(:image)).to be_valid
  end

  let(:image) { build(:image) }

  describe 'ActiveModel validations' do
    it { expect(image).to validate_presence_of(:title) }
  end
end
