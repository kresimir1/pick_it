Rails.application.routes.draw do
  root to: "products#index"
  devise_for :users
  resources :products do
    resources :reviews
  end

  resources :users

  resources :reviews do
      post 'upvote'
  end
end
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
