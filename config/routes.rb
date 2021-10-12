Rails.application.routes.draw do
  get 'profile/index/:user_id', to: 'profile#index', as: 'profile' 
  get 'dashboard/index'
  resources :posts do
    resources :comments do
     patch :accept, on: :member
  end
end
  root 'welcome#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
