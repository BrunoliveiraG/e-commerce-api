# frozen_string_literal: true

require 'sidekiq/web'
require 'sidekiq-scheduler/web'

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
      resources :orders, only: [:index, :show]
      namespace :dashboard do
        resources :sales_ranges, only: :index
        resources :summaries, only: :index
        resources :top_five_products, only: :index
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
      resources :games, only: :index
      resources :orders, only: [:index, :show]
    end
  end

  namespace :juno do
    namespace :v1 do
      resources :payment_confirmations, only: :create
    end
  end
end
