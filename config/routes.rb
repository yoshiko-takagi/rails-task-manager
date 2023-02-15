Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # root "articles#index"

  #Read all
  root to: 'tasks#index'
  get '/tasks', to: 'tasks#index', as: :tasks

  #Create
  get '/tasks/new', to: 'tasks#new', as: :new_task
  post '/tasks', to: 'tasks#create'

  #Read one
  get '/tasks/:id', to: 'tasks#show', as: :task

  #Update
  get '/tasks/:id/edit', to: 'tasks#edit', as: :edit_task
  patch '/tasks/:id', to: 'tasks#update'

  #Remove
  delete '/tasks/:id', to: 'tasks#destroy'
end
