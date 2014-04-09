BecksResume::Application.routes.draw do  

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')
  get '/signout', to: 'sessions#destroy', as: 'signout'
   
  resources :sessions, only: [:create, :destroy]
  resources :highlights

  resources :users 
  resources :experiences
  resources :languages
  resources :frameworks
  resources :skills
  resources :skill_topics
  
  root to: "users#index"

end
