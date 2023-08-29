# frozen_string_literal: true

module Front
  class MessagesController < ActionController::API
    def list
      render json: { messages: Message.last(10) }
    end
  end
end
