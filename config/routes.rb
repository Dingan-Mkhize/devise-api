Rails.application.routes.draw do
  resources :activity_logs
  devise_for :users, controllers: { 
    sessions: 'users/sessions',
    registrations: 'users/registrations'
    }
  
    get '/member_details' => 'members#index'
end
