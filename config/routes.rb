Rails.application.routes.draw do
  root 'courses#index'
  
  resources :students, except: [ :destroy ]

  get 'courses/new', to: 'courses#new'
  get 'about', to: 'pages#about'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  post 'courses/:id/enroll', to: 'student_courses#create', as: 'course_enroll'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
