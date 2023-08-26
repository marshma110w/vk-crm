# frozen_string_literal: true

Rails.application.routes.draw do
  post 'confirmation/confirm'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'hello#show'
  # Defines the root path route ("/")
  # root "articles#index"
end
