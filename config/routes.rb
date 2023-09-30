Rails.application.routes.draw do
  resources :activity_logs
  devise_for :users, controllers: { 
    sessions: 'users/sessions',
    registrations: 'users/registrations'
    }
  
end
