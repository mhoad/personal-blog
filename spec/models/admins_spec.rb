require 'rails_helper'

RSpec.describe 'Admins', type: :model do
  it 'has a valid factory' do
    expect(build(:admin)).to be_valid
  end

  let(:admin) { build(:admin) }

  describe 'ActiveModel validations' do
    it { expect(admin).to validate_presence_of(:email) }
    it { expect(admin).to validate_presence_of(:password) }
  end
end
