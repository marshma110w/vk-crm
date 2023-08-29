# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :front do
    get 'messages_list', to: 'messages#list'
  end

  namespace :api do
    post 'vk', to: 'vk#action'
  end
end
