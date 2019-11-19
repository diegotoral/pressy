# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'landing#index'

  # Create fancy login, logout and signup URLS.
  delete 'login', to: 'user_sessions#destroy', as: :destroy_session
  resources :users, only: %i[new create], path: 'signup', path_names: { new: '' }
  resources :user_sessions, only: %i[new create], path: 'login', path_names: { new: '' }


  namespace :dashboard, path: 'app' do
    root to: 'presentations#index'

    resources :previews, only: :show
    resources :presentations, only: %i[index new create destroy]
  end
end
