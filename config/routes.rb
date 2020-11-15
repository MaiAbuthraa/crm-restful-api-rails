Rails.application.routes.draw do
  devise_for :users, skip: :all
  devise_scope :user do
    scope :user, defaults: { format: :json } do
      post   '/signin',       to: 'authentication/sessions#create'
      delete '/signout',      to: 'devise/sessions#destroy'
      post   '/signup',       to: 'authentication/registrations#create'
      #put    '/account',      to: 'registrations#update'
      #delete '/account',      to: 'registrations#destroy'
      #put    '/password',     to: 'devise/passwords#update'
      #post   '/password',     to: 'devise/passwords#create'
      get    '/confirmation', to: 'authentication/confirmations#show'
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
