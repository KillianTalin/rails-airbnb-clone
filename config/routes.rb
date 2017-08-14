Rails.application.routes.draw do
  get 'chalets/index'

  get 'chalets/show'

  get 'chalets/new'

  get 'chalets/create'

  get 'chalets/edit'

  get 'chalets/update'

  get 'chalets/destroy'

  devise_for :users
  root to: 'chalets#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :chalets do
    resources :bookings, only: [ :index, :show, :new, :create]
  end
  resources :bookings, only: [ :edit, :update, :destroy ]
  resources :users, only: [ :show, :edit, :update ]
end
