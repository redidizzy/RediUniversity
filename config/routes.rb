Rails.application.routes.draw do
  root 'courses#index'
  
  resources :students, except: [ :destroy ]

  get 'about', to: 'pages#about'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  post 'courses/:id/enroll', to: 'student_courses#create', as: 'course_enroll'
  get 'courses/new', to: 'courses#new'
  post 'courses', to: 'courses#create'
  get 'courses/:id', to: 'courses#show', as: 'course'
  get 'courses/:id/edit', to: 'courses#edit', as: 'edit_course'
  match 'courses/:id', via: [:put, :patch], to: 'courses#update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
