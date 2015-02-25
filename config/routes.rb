Rails.application.routes.draw do
  
  devise_for :users

  
  get 'about' => 'welcome#about'



  root to: 'welcome#index'
  
  resources :wikis do 
    resources :collaborators, only: [:create, :destroy]
    
  end

  resources :charges, only: [:new, :create]

end
