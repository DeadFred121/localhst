Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :photos
  post '/rate' => 'rater#create', :as => 'rate'
  resources :tours do
    resources :reviews, only: [:create, :destroy]
    resources :markers, only: [:create, :destroy]
  end

  resources :conversations do
    resources :messages
  end

  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'pages#home'
  
  get 'stripe/connect'
  post 'tip', to: 'checkout#create'

  get 'tags/:tag', to: 'tours#index', as: :tag
  get 'profile/:user', to: 'profile#show', as: :profile
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
