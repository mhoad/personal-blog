Rails.application.routes.draw do
  resources :categories do
    resources :posts
  end

  devise_for :admins, skip: [:registrations]
  as :admin do
    get 'admins/edit' => 'devise/registrations#edit', :as => 'edit_admin_registration'
    put 'admins' => 'devise/registrations#update', :as => 'admin_registration'
  end

  root to: 'static_pages#index'
end
