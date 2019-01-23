Rails.application.routes.draw do
  resources :tasks
  resources :taskers
  resources :bosses
  get '/completed-tasks', to: 'tasks#index_completed', as: 'completed_tasks'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
