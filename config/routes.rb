Rails.application.routes.draw do
  
  
  root 'pages#index'
    post '/sign-in', to: 'pages#sign_in'
    post '/sign-out', to: 'pages#sign_out'

    # add a teacher to a cohort, via the teacher model (and return to view teacher)
    patch '/teacher/:id/cohort', to: 'teachers#add_to_cohort'
    # made crazy route temporarily, so that ajax will work.  need to debug:
    patch '/cohorts/:cohort_id/cohorts/:random_error/students/:student_id', to: 'cohorts#remove_student'

    # temp json routes:
    get '/students/all', to: 'students#all'
    get '/teachers/all', to: 'teachers#all'
    get '/pages/index_string', to: 'pages#index_string'
    get '/classes/all', to: 'courses#all'
    get '/cohorts/all', to: 'cohorts#all'

    #password hint via json
    get '/password-hint/:user_name', to: 'pages#password_hint'
    get '/password-hint', to: 'pages#password_hint'
    # test routes for postman:
    get '/tests', to: 'pages#tests'
    


  resources :students
  resources :teachers
  resources :courses
  resources :cohorts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
