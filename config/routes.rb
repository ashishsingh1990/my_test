Rails.application.routes.draw do
  resources :todos do
  	resources :comments, module: :todos
  end
  resources :campaigns do
  	resources :comments, module: :campaigns
  end
  devise_for :users
  root 'home#index'
  get "/users", to: "home#user_index"
  get "/user_edit", to: "home#user_edit"
  put "/user_update", to: "home#user_update"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

