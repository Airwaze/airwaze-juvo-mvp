Rails.application.routes.draw do
<<<<<<< HEAD
  root 'wallets#index'

  resources :order_transactions, only: :create

  resources :wallets, only: :show
=======
  devise_for :users,
    skip: [:sessions, :registrations, :passwords],
    controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks'
    }

  devise_scope :user do
    delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  authenticated nil, lambda { |u| u.regular? } do
    root 'users#show', as: :authenticated_user_root
  end

  authenticated nil, lambda { |u| u.merchant? } do
    root 'order_transactions#new', as: :authenticated_merchant_root
  end

  authenticated nil, lambda { |u| u.bank? } do
    root 'order_transactions#index', as: :authenticated_bank_root
  end

  root 'pages#home'

  resources :users, only: [] do
    post :sign_in_as_merchant, on: :collection
    post :sign_in_as_bank, on: :collection
  end

  resources :order_transactions, only: [:new, :create, :index] do
    get :redeem, on: :collection
  end
>>>>>>> airwaze-mvp/master
end
