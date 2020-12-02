# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users

  get '/auth/spotify/callback', to: 'users#spotify'
end
