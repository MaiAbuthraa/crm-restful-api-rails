Rails.application.routes.draw do
  devise_for :users, skip: :all
  devise_scope :user do
    scope :user, defaults: { format: :json } do
      post   '/signin',       to: 'users/sessions#create'
      delete '/signout',      to: 'users/sessions#destroy'
      post   '/signup',       to: 'users/registrations#create'
      put    '/password',     to: 'users/passwords#update', as: :edit_user_password
      post   '/password',     to: 'users/passwords#create'
      get    '/confirmation', to: 'users/confirmations#show'
      post    '/confirmation', to: 'users/confirmations#create'
    end
  end

  namespace :v1 do
    resources :customers do
      resources :contacts
      resources :orders
    end
  end
end
