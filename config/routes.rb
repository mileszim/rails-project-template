require 'sidekiq/web'
require_relative '../lib/route_constraints/admin_constraint'

Rails.application.routes.draw do
  # Health Check
  mount OkComputer::Engine, at: "/health_check"

  # Admin Panels
  constraints(RouteConstraints::AdminConstraint.new) do
    mount ActionCable.server       => '/cable'
    mount Sidekiq::Web             => '/sidekiq'
    mount Flipper::UI.app(Flipper) => '/flipper'
  end

  # /
  root 'root#index'

  # User Sessions
  get  '/login',  to: 'users/sessions#new',     as: :login
  post '/login',  to: 'users/sessions#create',  as: :login_create
  post '/logout', to: 'users/sessions#destroy', as: :logout

  # /users
  resources :users, only: [:new, :create, :update] do
    member do
      get :activate
    end
  end
end
