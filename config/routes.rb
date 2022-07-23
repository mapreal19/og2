# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'

  require "sidekiq/web"
  mount Sidekiq::Web, at: "/sidekiq"

  devise_for :users

  post "/factories/level_up", to: "factories#level_up"
end
