Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'banks#index'

  # Banks
  get '/banks' => 'banks#index'

  # Info
  get '/info' => 'info#index'


  # Sessions

  get 'sessions/new' => 'sessions#new', as: 'new_session'
  post 'sessions' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  # Users
  post '/user' => 'user#create'
  get '/users/#{session["user_id"]}/transactions' => 'transactions#index'
  post '/user/update' => 'users#update'
  post '/user/delete' => 'checking_accounts#delete'

  # User Stories
  get '/help' => 'user_stories#index'

  # Checking Accounts
  get '/checking_account/help' => 'checking_accounts#index'
  get '/checking_account/new' => 'checking_accounts#new'
  post 'checking_account/create' => 'checking_accounts#create'

  # MaroonPay
  get '/maroonpay/help' => 'maroonpay#index'
  get '/maroonpay' => 'maroonpay#new'
  get '/maroonpay/payment' => 'maroonpay#show'
  get '/maroonpay/withdraw' => 'maroonpay#show2'
  get '/maroonpay_2' => 'maroonpay#transfer'
  post 'maroonpay_2' => 'maroonpay#transferout'
#  post '/maroonpay/payment' => 'transactions#create'


  # Transaction
  get '/transactions' => 'transactions#index'
  post '/transactions/process' => 'transactions#create'
  post '/transactions/process2' => 'transactions#withdraw'
  post '/transactions/process3' => 'transactions#move'
  get '/transactions/process' => 'transactions#new'


  resources :banks
  resources :users

end
