Rails.application.routes.draw do
  devise_for :users, skip: :all
  devise_scope :user do
    scope :user, defaults: { format: :json } do
      post   '/signin',       to: 'users/sessions#create'
      delete '/signout',      to: 'devise/sessions#destroy'
      post   '/signup',       to: 'users/registrations#create'
      put    '/password',     to: 'users/passwords#update', as: :edit_user_password
      post   '/password',     to: 'users/passwords#create'
      get    '/confirmation', to: 'users/confirmations#show'
      #post   '/unlock',       to: 'devise/unlocks#create'
      #get    '/unlock',       to: 'devise/unlocks#show'
    end
  end

  namespace :api do
    namespace :v1 do
      resources :contacts
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
