Rails.application.routes.draw do
  root to: "products#index"
  devise_for :users
  resources :products do
    resources :reviews
  end

  resources :users

  resources :votes, only: [:create]

  namespace :api do
    namespace :v1 do
      resources :votes, only: [:create]
    end
  end

end
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
