Rails.application.routes.draw do
  root 'items#index'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :items, only: [:index, :show] do
        get '/items', to: 'items#index'
        get '/items', to: 'items#show'
      end
    end
  end
end
