# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  post '/', to: 'home#search'
end
