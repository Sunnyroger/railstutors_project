CourseProject::Application.routes.draw do
  
  resources :posts do
  	resources :comments, :only => [:new,:create,:delete]
  	resources :votes, :only => [:create]
  end
  resources :users, only: [:new,:create]
  resources :sessions, only: [:new, :create, :destroy]

  get 'register' => 'users#new', as: 'register'
  get 'login' => 'sessions#new', as: 'login'
  get 'logout' => 'sessions#destroy', as: 'logout'
  root :to => 'posts#index'
end
