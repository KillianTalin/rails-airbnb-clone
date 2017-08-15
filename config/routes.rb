Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :chalets do
    resources :bookings, only: [ :index, :show, :new, :create]
  end
  resources :bookings, only: [ :edit, :update, :destroy ]
  resources :users, only: [ :show, :edit, :update ]
end
