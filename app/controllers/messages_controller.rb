# frozen_string_literal: true

class MessagesController < ApplicationController
  def show; end

  def index; end

  def messages_list
    render json: { messages: Message.last(10) }
  end
end
