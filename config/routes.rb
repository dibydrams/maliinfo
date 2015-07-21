Rails.application.routes.draw do
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  root 'posts#index'
  resources :posts, path: 'article'
  resources :categories, path: 'categorie', only: [:show]
  get 'contact', to: 'messages#new', as: 'contact'
  post 'contact', to: 'messages#create'
end