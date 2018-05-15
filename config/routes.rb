Rails.application.routes.draw do
  
  
  root 'pages#index'
    post '/sign-in', to: 'pages#sign_in'
    post '/sign-out', to: 'pages#sign_out'
    # temp json routes:
    get '/students/all', to: 'students#all'
    get '/teachers/all', to: 'teachers#all'
    get '/pages/index_string', to: 'pages#index_string'
    get '/classes/all', to: 'courses#all'
    get '/cohorts/all', to: 'cohorts#all'



  resources :students
  resources :teachers
  resources :courses
  resources :cohorts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
