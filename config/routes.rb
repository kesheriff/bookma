Rails.application.routes.draw do
  devise_for :users
  resources :reviews,:movies,:tmdb_search
  root to: 'movies#index'
  get 'search' => 'movie_from_tmdb#index' , as:'search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
