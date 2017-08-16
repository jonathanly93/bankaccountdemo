Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'bank#index'

  # Banks
  get '/banks' => 'bank#index'

  # Info
  get '/info' => 'info#index'

  # Sessions

  get 'sessions/new' => 'session#new', as: 'new_session'
  post 'sessions' => 'session#create'

  delete '/logout' => 'session#destroy'

  # Users
  post '/user' => 'user#create'
#  get '/user/#{session["user_id"]}/transactions' => 'transaction#index'
  get '/user/#{session["user_id"]}' => 'user#show'
  post '/user/update' => 'user#update'
  post '/user/delete' => 'checking_account#delete'

  # User Stories
  get '/help' => 'user_stories#index'

  # Checking Accounts
  get '/checking_account/help' => 'checking_account#index'
  get '/checking_account/new' => 'checking_account#new'
  post 'checking_account/create' => 'checking_account#create'

  # MaroonPay
  get '/maroonpay/help' => 'maroonpay#index'
  get '/maroonpay' => 'maroonpay#new'
  get '/maroonpay/payment' => 'maroonpay#show'
  get '/maroonpay/withdraw' => 'maroonpay#show2'
  get '/maroonpay_2' => 'maroonpay#transfer'
  post '/maroonpay_2' => 'maroonpay#transferout'

  # Transaction
  get '/transactions' => 'transaction#index'
  post '/transactions/process' => 'transaction#create'
  post '/transactions/process2' => 'transaction#withdraw'
  post '/transactions/process3' => 'transaction#move'

  resources :bank
  resources :user

end
