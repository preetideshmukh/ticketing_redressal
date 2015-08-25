Rails.application.routes.draw do
  post '/emails' => 'emails#create'

  root :to =>'home#home_page'
  get 'home/combine_forms'
  as :user do
      match '/user/confirmation' => 'confirmations#update', :via => :patch, :as => :update_user_confirmation
      
  end
  # match '/auth/facebook/logout' => 'application#facebook_logout', :via => :delete, :as => :facebook_logout
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks", :registrations => "registrations", :confirmations => "confirmations" }
  
  devise_scope :user do
    get "users/edit_customer_care", to: "devise/registrations#edit_customer_care"
  end
  resources :users
  get 'home_page' => 'home#home_page'
  get 'success'=>'home#success'
  get 'payment'=>'home#payment'
  get 'graph'=>'home#graph'
  get 'dashboard' => 'home#dashboard'  
  post 'customer_response_message' => 'home#customer_response_message'

resources :home do
  collection do
    get :company_code_generator
  end
end
resources :tickets do
   resources :comments
 end
resources :users
resources :plans
 
  match ':controller(/:action(/:id))', :via => [:get, :post,:patch,:put]

 resources :plan_subscriptions do
    collection do
      post :set_validity_for_plan
      post :plan_summary
      post :transaction_hashchecksum_detail
      get :payment_confirmation
      # post :txn_callback_response
      # get :client_current_plan
    end
  end
 
end
