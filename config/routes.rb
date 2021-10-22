Rails.application.routes.draw do
  get 'profile/index/:user_id', to: 'profile#index', as: 'profile' 
  get 'dashboard/index'
  resources :posts do
     patch :up_vote, on: :member
     patch :down_vote, on: :member
   resources :comments do
     patch :accept, on: :member
     patch :deny,   on: :member
  end
end
  root 'welcome#index'
  devise_for :users

  resources :profile do
    get :feed, on: :collection
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :relationships, only: [:create, :destroy]
end
