# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web, at: '/sidekiq'

  root 'contact_files#index'
  devise_for :users
  resources :contact_files, except: %i[edit update destroy]
  resources :contacts, only: %i[index]
end
