# frozen_string_literal: true

class Message < ApplicationRecord
  class << self
    def create_from_vk(params)
      Message.create(client_id: params[:from_id], body: params[:text])
    end
  end
end
