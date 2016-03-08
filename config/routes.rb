Rails.application.routes.draw do
  root 'items#index'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :items, only: [:index, :show, :destroy] do
        get '/items', to: 'items#index'
        get '/items', to: 'items#show'
        get '/items', to: 'items#delete'
      end
    end
  end
end
