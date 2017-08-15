Rails.application.routes.draw do
  devise_for :users
  root to: 'chalets#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :chalets do
    resources :bookings, only: [ :show, :new, :create]
  end
  resources :bookings, only: [ :index, :edit, :update, :destroy ]
  resources :users, only: [ :show, :edit, :update ]
  mount Attachinary::Engine => "/attachinary"
end
