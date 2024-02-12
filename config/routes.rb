# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  root 'notifications#index'

  resources :notifications, only: %i[index]

  devise_for :users
  mount Sidekiq::Web => '/sidekiq'
end
