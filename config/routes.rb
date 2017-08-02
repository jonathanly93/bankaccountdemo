Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'banks#index'

  # Banks
  get '/banks' => 'banks#index'


  # Sessions

  get 'sessions/new' => 'sessions#new', as: 'new_session'
  post 'sessions' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  # Users
  post '/user' => 'user#create'
  get '/users/#{session["user_id"]}/transactions' => 'transactions#index'

  # User Stories
  get '/help' => 'user_stories#index'

  # Checking Accounts
  get '/checking_account/help' => 'checking_accounts#index'
  get '/checking_account/new' => 'checking_accounts#new'
  post 'checking_account/create' => 'checking_accounts#create'

  # Savings Account
  get '/saving_account/help' => 'saving_accounts#index'
  get '/saving_account/new' => 'saving_account#new'

  # MaroonPay
  get '/maroonpay/help' => 'maroonpay#index'
  get '/maroonpay' => 'maroonpay#new'

  # Account
  get '/account/help' => 'account#index'

  get '/info' => 'info#index'

  # Transaction
  get '/transactions' => 'transactions#index'

  resources :banks
  resources :users
end
