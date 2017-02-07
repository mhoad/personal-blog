Rails.application.routes.draw do
  # devise_for :admins

  devise_for :admins, :skip => [:registrations]
  as :admin do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    patch'users/:id' => 'devise/registrations#update', :as => 'user_registration'
  end


  root to: 'static_pages#index'
  resources :posts
end
