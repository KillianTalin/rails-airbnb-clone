Rails.application.routes.draw do
  devise_for :users,
   controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'chalets#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :chalets do
    resources :bookings, only: [ :index, :show, :new, :create]
  end
  resources :bookings, only: [ :edit, :update, :destroy ]
  resources :users, only: [ :show, :edit, :update ]
  mount Attachinary::Engine => "/attachinary"
end
