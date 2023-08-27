# frozen_string_literal: true

Rails.application.routes.draw do
  root 'messages#index'

  resources :messages, only: :index do
    collection do
      get 'messages_list'
    end
  end

  namespace :api do
    post 'vk', to: 'vk#action'
  end
end
