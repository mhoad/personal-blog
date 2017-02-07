require 'rails_helper'

RSpec.describe 'Web Sign Up', type: :feature do
  it 'should not allow me to create an account via the web interface' do
    expect { visit '/admins/sign_up' }.to raise_error(ActionController::RoutingError)
  end
end
