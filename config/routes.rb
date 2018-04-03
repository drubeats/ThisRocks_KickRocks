Rails.application.routes.draw do
  resources :bands
    get "like" => "bands#upvote"
    get "dislike" => "bands#downvote"

  # root 'home#index'
  root 'bands#index'

  get "/auth/:provider/callback" => "sessions#create"
  get "/signout" => "sessions#destroy", as: :signout

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
