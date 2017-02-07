Rails.application.routes.draw do
  # devise_for :admins

  devise_for :admins, :skip => [:registrations]
  as :admin do
    get 'admins/edit' => 'devise/registrations#edit', :as => 'edit_admin_registration'
    patch'admins/:id' => 'devise/registrations#update', :as => 'admin_registration'
  end


  root to: 'static_pages#index'
  resources :posts
end
