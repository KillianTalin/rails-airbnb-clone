Rails.application.routes.draw do
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :chalets do
    resources :bookings, only: [ :show, :new, :create, :edit, :update,]
  end
  resources :bookings, only: [ :index, :destroy ]
  resources :users, only: [ :show, :edit, :update ]
  mount Attachinary::Engine => "/attachinary"
end
