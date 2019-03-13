Rails.application.routes.draw do
  resources :products do
    collection do
      get 'raj'
    end
    member do
      get 'image'
    end
  end
  get 'auth/:provider/callback', to: 'users#facebook'
  resources 'users' do
    collection do
      get "sign_in"
      post "authentication"
      delete "logout"
      get 'download_in_csv'
    end
  end
  get 'sign_in', to: "users#sign_in"
  get 'registration', to: "users#new"
  namespace :api do
    resources :users, only: [:index, :create, :update, :destroy]
  end
  # match 'hello', to: "users#hello" , via: [:get, :post]

  root to: "users#index"

get "purchase_item", to: "products#make_payment"
post "process_payment" , to: "products#process_payment"
get 'profile', action: :show, controller: 'users'
get 'profile', to:  'users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
