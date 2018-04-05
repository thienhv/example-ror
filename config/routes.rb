# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  post '/', to: 'home#search'

  namespace :api do
    namespace :v1 do
      resources :developers, only: %i[index show]
    end
  end
end
