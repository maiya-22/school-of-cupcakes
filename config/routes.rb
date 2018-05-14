Rails.application.routes.draw do
  
  
  resources :cohorts
  root 'pages#index'
    # temp json routes:
    get '/students/all', to: 'students#all'
    get '/teachers/all', to: 'teachers#all'
    get '/pages/index_string', to: 'pages#index_string'
    get '/classes/all', to: 'courses#all'
  resources :students
  resources :teachers
  resources :courses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
