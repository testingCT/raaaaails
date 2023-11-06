Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, path: 'accounts', controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  # Other routes for your application...
  # Add the sign out route
  devise_scope :user do
    get 'accounts/sign_out', to: 'sessions#destroy', as: :sign_out
  end

  # Add the custom route for POST /users
  post 'accounts', to: 'users/registrations#create'


  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
  # Root route
  root 'pages#authentication'
end

