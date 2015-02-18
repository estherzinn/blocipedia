Rails.application.routes.draw do
  
  devise_for :users

  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
  resources :wikis

  resources :charges, only: [:new, :create]

end
