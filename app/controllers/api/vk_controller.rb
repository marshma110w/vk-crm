# frozen_string_literal: true

module Api
  class VkController < ActionController::API
    GROUP_ID = 201246423

    before_action :authenticate_api

    def action
      case params[:type]
      when 'confirmation'
        head 400 if params[:group_id] != GROUP_ID
        render json: ENV['VK_CONFIRMATION_KEY']

      else
        Rails.logger.warn("Unhandled action: #{params[:type]}")
        head 501
      end
    end

    private

    def authenticate_api
      head 401 if params[:secret] != ENV['VK_API_KEY']
    end
  end
end
