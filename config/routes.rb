# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'landing#index'

  # Make fancy login and logout paths
  get '/login', to: 'user_sessions#new'
  resources :user_sessions, only: %i[create destroy], path: 'login'

  namespace :dashboard, path: 'app' do
    root to: 'presentations#index'

    resources :presentations, only: :index
  end
end
