# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  mount_devise_token_auth_for 'User', at: 'auth/v1/user'

  namespace :admin do
    namespace :v1 do
      get 'home' => 'home#index'
      resources :categories
      resources :system_requirements
      resources :coupons
      resources :users
      resources :products
      resources :games, only: [], shallow: true do
        resources :licenses
      end
    end
  end

  namespace :storefront do
    namespace :v1 do
      get 'home' => 'home#index'
      resources :products, only: %i[index show]
      resources :categories, only: :index
      resources :checkouts, only: :create
      resources :wish_items, only: %i[index create destroy]
      post '/coupons/:coupon_code/validations', to: 'coupon_validations#create'
    end
  end
end
