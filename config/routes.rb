# frozen_string_literal: true

Rails.application.routes.draw do
  root 'hello#show'

  namespace :api do
    post 'vk', to: 'vk#action'
  end
end
