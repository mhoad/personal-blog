Rails.application.routes.draw do
  resources :images
  devise_for :admins, skip: [:registrations]
  as :admin do
    get 'admins/edit' => 'devise/registrations#edit', :as => 'edit_admin_registration'
    put 'admins' => 'devise/registrations#update', :as => 'admin_registration'
  end

  get '/categories/:id/edit(.:format)', to: 'categories#edit', as: 'edit_category'

  resources :categories, path: '', except: [:index] do
    resources :posts, path: '', except: [:index]
    get '/:friendly_id', to: 'posts#show', as: 'category_post'
  end

  root to: 'static_pages#index'
end
