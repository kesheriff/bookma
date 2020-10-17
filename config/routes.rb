Rails.application.routes.draw do
  resources :reviews,:movies
  root to: 'movies#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
