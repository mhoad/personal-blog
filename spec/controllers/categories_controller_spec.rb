require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  it 'handles permission errors by redirecting to a safe place' do
    allow(controller).to receive(:current_admin)

    category = FactoryGirl.create(:category)
    get :edit, params: { id: category }

    expect(response).to redirect_to(root_path)
    message = "You aren't allowed to do that."
    expect(flash[:alert]).to eq message
  end
end
