# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :messages do
    get 'list', to: 'messages#list'
  end

  namespace :api do
    post 'vk', to: 'vk#action'
  end
end
