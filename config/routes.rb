Rails.application.routes.draw do
  resources :reports
  resources :students
  resources :subjects
  resources :users
  root :to => "users#login_page"

  get 'login_page', to: 'users#login_page'
  post 'login', to: 'users#login'
  get 'log_out', to: 'users#log_out' 
  get 'dashboard', to: 'users#dashboard'
  get 'teacher_dashboard', to: 'users#teacher_dashboard'
  get 'edit_report',to:'users#edit_report'
  post 'report',to: 'users#report'
  get 'dashboard_report', to: 'reports#dashboard_report'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
