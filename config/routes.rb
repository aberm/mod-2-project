Rails.application.routes.draw do
  get 'pages/about'
  get 'pages/contact'
  get 'pages/faqs'
  resources :tasks
  resources :taskers
  resources :bosses
  get '/completed-tasks', to: 'tasks#index_completed', as: 'completed_tasks'


  get 'sessions/new' => 'sessions#new'
  get '/login' => 'sessions#new', as: 'login'
  post '/login' => 'sessions#create'
  post '/sessions' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
